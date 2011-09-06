class JobsController < ApplicationController
  authorize_resource
  
  before_filter :find_job, only: [:edit, :update]
  
  respond_to :html, :json
  
  
  def index
    @jobs = Job.all
  end
  
  def new
    @job = current_user.jobs.new
  end
  
  def edit
  end
  
  def create
    @job = current_user.jobs.create(params[:job])
    if @job.save
      redirect_to jobs_path, :notice => 'Job successfully created!'
    else
      render action: :new
    end
  end
  
  def update
    if @job.update_attributes(params[:job])
      redirect_to job_path(@job), :notice => 'Job successfully updated!'
    else
      render action: :edit
    end
  end
  
  def feed
    @jobs = Job.all
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
  
  
  private
  
  def find_job
    @job = Job.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to jobs_path, alert: "Sorry, but that job could not be found."
  end
end