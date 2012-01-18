class UsersController < ApplicationController
  load_and authorize_resource except: [:index, :conference_reps, :national_committee, :search]
  
  respond_to :html, :json
  
  def index
    @users = User.paginate(page: params[:page], per_page: 30)
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  def create
    if @user.save
      redirect_to user_path(@user), notice: "User successfully created!"
    else
      render action: :new
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: "User successfully updated!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path, alert: "User successfully deleted."
  end
  
  # Non RESTful Actions
  
  def conference_reps
    @users = User.where(conference_rep: true).paginate(:page => params[:page], :per_page => 30)
    authorize! :read, @users
  end
  
  def national_committee
    @users = User.where(national_committee: true).paginate(:page => params[:page], :per_page => 30)
    authorize! :read, @users
  end
  
  def search
    @users = User.where(["last_name LIKE ?", "%#{params[:last_name]}%"]).paginate(:page => params[:page], :per_page => 30)
    flash[:notice] = "Sorry, no users found by last name: #{params[:last_name]}." unless @users.size > 0
    authorize! :read, @users
    render action: :index
  end
end
