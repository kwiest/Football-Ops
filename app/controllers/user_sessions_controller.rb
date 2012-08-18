class UserSessionsController < ApplicationController
  skip_before_filter :ensure_authenticated, except: :current

  def new
    redirect_to root_path if signed_in?
  	@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to directory_path
    else
      render action: :new
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    
    redirect_to root_path, notice: "Successfully signed-out. Come back soon."
  end

  def current
    render json: current_user, root: false
  end
end
