class UserSessionsController < ApplicationController
  before_filter :ensure_authenticated, only: :current

  def new
    redirect_to root_path if signed_in?
  	@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to_path = session.fetch 'redirect_after_sign_in', directory_path
      session['redirect_after_sign_in'] = nil
      redirect_to redirect_to_path
    else
      render action: :new
    end
  end
  
  def destroy
    flash[:notice] = 'Successfully signed-out. Come back soon.'
    redirect_to root_path and return unless signed_in?
    current_user_session.destroy
    redirect_to root_path
  end

  def current
    render json: current_user, root: false
  end
end
