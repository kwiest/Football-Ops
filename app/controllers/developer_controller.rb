class DeveloperController < ApplicationController
  before_filter :set_api_uris

  def index
  end

  def authentication
    @access_token = { 
      "access_token" => "YOUR_TOKEN",
      "token_type" => "bearer",
      "created_at" => Time.now, 
      "user" => UserSerializer.new(user).serializable_hash
    }
  end

  def users
    @kyle = UserSerializer.new(kyle).serializable_hash
    @hawk = UserSerializer.new(hawk).serializable_hash
    @user = UserSerializer.new(user).serializable_hash
  end

  def schools
    @school = SchoolSerializer.new(user.school).serializable_hash
    trim_user_ids_for @school
  end

  def conferences
    @conference = ConferenceSerializer.new(user.conference).serializable_hash
    trim_user_ids_for @conference
  end

  def districts
    @district = DistrictSerializer.new(user.district).serializable_hash
    trim_user_ids_for @district
  end

  def divisions
    @division = DivisionSerializer.new(user.division).serializable_hash
    trim_user_ids_for @division
  end


  private

  def set_api_uris
    @api_base_uri = 'https://footballops.herokuapp.com'
    @api_versioned_uri = '/api/v1'
  end

  def kyle
    User.find 105
  end

  def hawk
    User.find 104
  end

  def user
    if signed_in?
      current_user
    else
      kyle
    end
  end

  def trim_user_ids_for(resource)
    resource[:user_ids] = [ user.id, 'next_user_id' ]
  end
end
