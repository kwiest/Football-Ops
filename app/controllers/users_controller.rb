class UsersController < InheritedResources::Base
  before_filter :sign_in_required, :except => [:new, :create]
  before_filter :authorized?, :only => [:edit, :update]
  actions :all, :except => [:destroy]
  respond_to :html, :xml, :json
  
  # GET /users/conference_reps
  # GET /users/conference_reps.xml
  def conference_reps
  	@users = User.find_all_by_conference_rep(true)
  end
  
  # GET /users/national_committee
  # GET /users/national_committee.xml
  def national_committee
  	@users = User.find_all_by_national_committee(true)
  end
  
  # GET /users/search
  # GET /users/search.xml
  def search
    @users = User.full_name_like(params[:last_name])
  	flash[:notice] = "Sorry, no users found by last name: #{params[:last_name]}." unless @users.size > 0
  end
  
  
  private
  
  def authorized?
    @user = User.find(params[:id])
    @user.changeable_by?(current_user) || access_denied
  end
end
