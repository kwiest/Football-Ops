class UserSessionsController < ApplicationController
  def new
    redirect_to root_path if signed_in?
  	@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:success] = "Successfully signed in."
      redirect_to root_url
    else
      render :new
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    
    flash[:notice] = "Successfully signed out."
    redirect_to root_url
  end
end