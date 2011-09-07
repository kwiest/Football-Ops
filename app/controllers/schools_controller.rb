class SchoolsController < ApplicationController
  authorize_resource
  
  before_filter :find_school, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @schools = School.paginate(page: params[:page], per_page: 30)
  end
  
  def show
    @users = @school.users.paginate(page: params[:page], per_page: 30)
  end
  
  def new
    @school = School.new
  end
  
  def edit
  end
  
  def create
    @school = School.create(params[:school])
    if @school.save
      redirect_to schools_path(@school), notice: "School successfully created!"
    else
      render action: :new
    end
  end
  
  def update
    if @school.update_attributes(params[:school])
      redirect_to schools_path(@school), notice: "School successfully updated!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @school.destroy
    redirect_to schools_path, alert: "School successfully deleted."
  end
  
  def search
    @schools = School.where(["name LIKE ?", "%#{params[:name]}%"]).paginate(page: params[:page], per_page: 30)
    flash[:alert] = "Sorry, no schools found with a name like #{params[:name]}." unless @schools.size > 0
    render action: :index
  end
  
  
  private
  
  def find_school
    @school = School.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to schools_path, alert: "Sorry, but that school could not be found."
  end
end