class ApplicationController < ActionController::Base
  before_filter :find_recent_jobs
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :current_user, :signed_in?, :admin?
  
  private
  
  def signed_in?
    current_user
  end
  
  def current_user_session  
    return @current_user_session if defined?(@current_user_session)  
    @current_user_session = UserSession.find  
  end  
  
  def current_user  
    @current_user = current_user_session && current_user_session.record
  end
  
  def sign_in_required
  	signed_in? || access_denied
  end
  
  def require_no_user
    if current_user
      flash[:notice] = "You have to sign-out before you can access this page."
      redirect_to current_user
    end
  end
  
  def admin_required
    current_user.admin? || access_denied
  end
  
  def admin?
  	current_user.admin?
  end
  
  def access_denied
    flash[:error] = "Sorry, but you don't have access to this section."
    redirect_to root_url
  end
  
  # Find object for polymorphic uploads
  def context
    if params[:conference_id]
      Conference.find(params[:conference_id])
    elsif params[:district_id]
      District.find(params[:district_id])
    elsif params[:division_id]
      Division.find(params[:division_id])
    elsif params[:school_id]
      School.find(params[:school_id])
    end
  end
  
  def find_recent_jobs
    @jobs = Job.all(:limit => 5)
  end
end
