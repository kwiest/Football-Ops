class UsersController < ApplicationController
  load_and_authorize_resource
  
  def new
  end

  def create
    if @user.save
      redirect_to directory_path, notice: 'User successfully created!'
    else
      render action: 'new'
    end
  end
end
