class PasswordResetsController < ApplicationController
  before_filter :require_no_user
  before_filter :find_user_using_perishable_token, only: %w(edit update)
  
  def new
  end
  
  def create
    @user = User.find_by_email! params[:user][:email]
    @user.reset_perishable_token!
    UserMailer.password_reset_instructions(@user).deliver
    redirect_to root_path, notice: 'An email with a link to reset your password has been sent to you.'
  rescue ActiveRecord::RecordNotFound
    render action: 'new', alert: 'We could not find any account with that email address.'
  end
  
  def edit
  end
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save
      redirect_to directory_path, notice: 'Password successfully updated!'
    else
      render action: 'edit'
    end
  end
  

  private
    
  def find_user_using_perishable_token
    @user = User.find_by_perishable_token! params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to new_password_reset_path,
      alert: 'Sorry, we cannot find your account. Try copying and pasting the link directly from your email.'
  end
end
