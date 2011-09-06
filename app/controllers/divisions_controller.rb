class DivisionsController < ApplicationController
  authorize_resource
  
  before_filter :find_division, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @divisions = Division.all
  end
  
  def show
    @users = @division.users.paginate(page: params[:page], per_page: 30)
  end
  
  def new
    @division = Division.new
  end
  
  def edit
  end
  
  def create
    @division = Division.create(params[:division])
    if @division.save
      redirect_to divisions_path(@division), notice: "Division successfully created!"
    else
      render action: :new
    end
  end
  
  def update
    if @division.update_attributes(params[:division])
      redirect_to divisions_path(@division), notice: "Division successfully updated!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @division.destroy
    redirect_to divisions_path, alert: "Division successfully deleted."
  end
  
  
  private
  
  def find_division
    @division = Division.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to divisions_path, alert: "Sorry, but that division could not be found."
  end
end