class UsersController < ApplicationController
  skip_before_filter :ensure_authenticated
  load_and_authorize_resource except: [:index, :conference_reps, :national_committee, :search]
  
  def new
  end

  def create
    if @user.save
      redirect_to user_path(@user), notice: "User successfully created!"
    else
      render action: :new
    end
  end
end
