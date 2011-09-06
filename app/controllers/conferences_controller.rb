class ConferencesController < ApplicationController
  authorize_resource
  
  before_filter :find_conference, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :json
  
  def index
    @conferences = Conference.all
  end
  
  def show
    @users = @conference.users.paginate(page: params[:page], per_page: 30)
  end
  
  def new
    @conference = Conference.new
  end
  
  def edit
  end
  
  def create
    @conference = Conference.create(params[:conference])
    if @conference.save
      redirect_to conference_path(@conference), notice: "Conference successfully created!"
    else
      render action: :new
    end
  end
  
  def update
    if @conference.update_attributes(params[:conference])
      redirect_to conference_path(@conference), notice: "Conference successfully updated!"
    else
      render action: :edit
    end
  end
  
  def destroy
    @conference.destroy
    redirect_to conferences_path, alert: "Conference successfully deleted."
  end
  
  
  private
  
  def find_conference
    @conference = Conference.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Sorry, but that conference cannot be found."
  end
end
