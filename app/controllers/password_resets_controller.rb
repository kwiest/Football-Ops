class PasswordResetsController < ApplicationController
  before_filter :require_no_user
  before_filter :find_user_using_perishable_token, :only => [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by_email(params[:user][:email])
    
    if @user
      @user.deliver_password_reset_instructions
      flash[:notice] = "An email with password reset instructions has been emailed to you. Please check your email."
      redirect_to root_path
    else
      flash[:notice] = "We couldn't find any account with the email: #{params[:user][:email]}..."
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save
      flash[:notice] = "Password successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
    
    def find_user_using_perishable_token
      @user = User.find_by_perishable_token(params[:id])
      
      unless @user
        flash[:error] = "We're sorry, but we cannot find your account. Try copying and pasting the link from your email into your browser or starting over."
        redirect_to new_password_reset_path
      end
    end
end
