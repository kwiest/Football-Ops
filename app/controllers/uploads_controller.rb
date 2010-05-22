class UploadsController < ApplicationController
  before_filter :sign_in_required
  before_filter :find_parent
  before_filter :authorized, :except => [:new, :create]
  
  def new
    @upload = @parent.uploads.new
  end
  
  def edit
  end
  
  def create
    @upload = @parent.uploads.new(params[:upload])
    
    if @upload.save
      current_user.uploads << @upload
      flash[:notice] = "File uploaded successfully."
      redirect_to @parent
    else
      render :new
    end
  end
  
  def update
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "File upload updated successfully."
      redirect_to @parent
    else
      render :edit
    end
  end
  
  def destroy
    @upload.destroy
    flash[:notice] = "Upload has successfully been deleted."
    redirect_to @parent
  end
  
  private
  
    def find_parent
      @parent = context
    end
    
    def authorized
      @upload = Upload.find(params[:id])
      access_denied unless @upload.changeable_by?(current_user)
    end
end