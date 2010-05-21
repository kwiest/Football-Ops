class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
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
end
