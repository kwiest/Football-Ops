class DistrictsController < ApplicationController
  authorize_resource
  
  before_filter :find_district, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @districts = District.all
  end
  
  def show
    @users = @district.users.paginate(page: params[:page], per_page: 30)
  end
  
  def new
    @district = District.new
  end
  
  def create
    @district = District.create(params[:district])
    if @district.save
      redirect_to district_path(@district), notice: "District successfully created!"
    else
      render action: :new
    end
  end
  
  def update
    if @district.update_attributes(params[:district])
      redirect_to district_path(@district), notice:"District successfully updated!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @district.destroy
    redirect_to districts_path, alert: "District successfully deleted."
  end
  
  
  private
  
  def find_district
    @district = District.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to districts_path, alert: "Sorry, but that district cannot be found."
  end
end
