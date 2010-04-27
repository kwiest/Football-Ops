class DistrictsController < ApplicationController
  before_filter :sign_in_required
  
  # GET /districts
  # GET /districts.xml
  def index
    @districts = District.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts }
    end
  end

  # GET /districts/1
  # GET /districts/1.xml
  def show
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @district }
    end
  end
end
