class ApplicationController < ActionController::Base
  before_filter :ensure_authenticated

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :current_user, :signed_in?, :admin?
  
  rescue_from CanCan::AccessDenied do |exception|
    head :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    head :not_found
  end
  
  private
  
  def current_user
    @current_user = current_user_session && current_user_session.record
  end
  
  def current_user_session  
    return @current_user_session if defined?(@current_user_session)  
    @current_user_session = UserSession.find  
  end  

  def ensure_authenticated
    head :unauthorized unless signed_in?
  end
  
  def require_no_user
    if current_user
      redirect_to current_user, alert: "You have to sign-out before you can access this page."
    end
  end

  def signed_in?
    current_user
  end
  
end
