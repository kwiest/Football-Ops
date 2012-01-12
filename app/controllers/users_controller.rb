class UsersController < ApplicationController
  authorize_resource
  
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @users = User.paginate(page: params[:page], per_page: 30)
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def create
    @user = User.create(params[:user])
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
  
  
  private
  
  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Sorry, but that user cannot be found."
  end
end
