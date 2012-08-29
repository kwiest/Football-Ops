class DeveloperController < ApplicationController
  skip_before_filter :ensure_authenticated

  def index
  end

  def users
    @kyle= UserSerializer.new(User.find 105).serializable_hash
    @hawk = UserSerializer.new(User.find 104).serializable_hash
    if signed_in?
      @user = UserSerializer.new(current_user).serializable_hash
    else
      @user = @kyle
    end
  end

  def schools
    if signed_in?
      @school = SchoolSerializer.new(current_user.school).serializable_hash
    else
      # Use Oregon by default
      @school = SchoolSerializer.new(School.find 345).serializable_hash
    end
  end

  def conferences
    if signed_in?
      @conference = ConferenceSerializer.new(current_user.conference).serializable_hash
    else
      @conference = ConferenceSerializer.new(Conference.find 58).serializable_hash
    end
  end

  def districts
    if signed_in?
      @district = DistrictSerializer.new(current_user.district).serializable_hash
    else
      @district = DistrictSerializer.new(District.find 9).serializable_hash
    end
  end

  def divisions
    if signed_in?
      @division = DivisionSerializer.new(current_user.division).serializable_hash
    else
      @division = DivisionSerializer.new(Division.find 2).serializable_hash
    end
  end
end
