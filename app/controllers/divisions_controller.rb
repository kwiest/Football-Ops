class DivisionsController < ApplicationController
  before_filter :sign_in_required
  
  # GET /divisions
  # GET /divisions.xml
  def index
    @divisions = Division.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @divisions }
    end
  end

  # GET /divisions/1
  # GET /divisions/1.xml
  def show
    @division = Division.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @division }
    end
  end
end
