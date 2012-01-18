class PasswordResetsController < ApplicationController
  before_filter :require_no_user
  before_filter :find_user_using_perishable_token, :only => [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by_email(params[:user][:email])
    
    if @user
      begin
        @user.reset_perishable_token!
        UserMailer.password_reset_instructions(@user).deliver
      rescue Postmark::InvalidMessageError
        flash[:alert] = "We could not send you a message to reset your email because an error occured while trying to send. Please try again later."
      end
      redirect_to root_path, notice: "An email with password reset instructions has been emailed to you. Please check your email."
    else
      render action: :new, alert: "We couldn't find any account with the email: #{params[:user][:email]}..."
    end
  end
  
  def edit
  end
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save
      redirect_to user_path(@user), notice: "Password successfully updated!"
    else
      render action: :edit
    end
  end
  
  private
    
  def find_user_using_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    
    unless @user
      redirect_to new_password_reset_path, alert: "We're sorry, but we cannot find your account. Try copying and pasting the link from your email into your browser or starting over."
    end
  end
end
