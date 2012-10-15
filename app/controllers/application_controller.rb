class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :current_user, :signed_in?
  
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
    @current_user_session ||= UserSession.find
  end  

  def ensure_authenticated
    unless signed_in?
      session['redirect_after_sign_in'] = request.path
      redirect_to sign_in_path, alert: 'You must be signed-in to access this page.'
    end
  end
  
  def require_no_user
    redirect_to directory_path, alert: 'You have to sign-out before you can access this page.' if signed_in?
  end

  def signed_in?
    current_user
  end
  
end
