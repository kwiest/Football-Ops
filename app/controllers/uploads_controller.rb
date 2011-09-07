class UploadsController < ApplicationController
  authorize_resource
  
  before_filter :find_parent
  before_filter :find_upload, only: [:edit, :update, :destroy]
  
  def new
    @upload = @parent.uploads.new
  end
  
  def edit
  end
  
  def create
    @upload = @parent.uploads.new(params[:upload])
    
    if @upload.save
      current_user.uploads << @upload
      redirect_to @parent, notice: "File uploaded successfully!"
    else
      render action: :new
    end
  end
  
  def update
    if @upload.update_attributes(params[:upload])
      redirect_to @parent, notice: "File upload updated successfully!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @upload.destroy
    redirect_to @parent, alert: "Upload has successfully been deleted."
  end
  
  
  private
  
  def find_upload
    @upload = Upload.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Sorry, but that upload could not be found."
  end
  
  def find_parent
    if params[:user_id]
      @parent = User.find(params[:user_id])
    elsif params[:school_id]
      @parent = School.find(params[:school_id])
    elsif params[:conference_id]
      @parent = Conference.find(params[:conference_id])
    elsif params[:district_id]
      @parent = District.find(params[:district_id])
    elsif params[:division_id]
      @parent = Division.find(params[:division_id])
    else
      redirect_to root_path, alert: "Sorry, but there was an error while trying to find that page."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Sorry, but there was an error while trying to find that page."
  end
end