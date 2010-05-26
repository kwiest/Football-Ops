class JobsController < InheritedResources::Base
  before_filter :sign_in_required, :except => [:index, :show, :feed]
  before_filter :authorized?, :only => [:edit, :update, :destroy]
  skip_before_filter :find_recent_jobs
  actions :all
  respond_to :html, :xml, :json
  uses_tiny_mce :options => { :theme => 'advanced',
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_buttons1 => %w{bold italic bullist numlist},
    :theme_advanced_buttons2 => [],
    :theme_advanced_buttons3 => []
  }, :only => [:new, :create, :edit, :update]
      
  
  def index
    @full_time = Job.full_time
    @part_time = Job.part_time
    @paid_internships = Job.paid_internships
    @unpaid_internships = Job.unpaid_internships
    index!
  end
  
  def create
    @job = current_user.jobs.create(params[:job])
    create!
  end
  
  def feed
    @jobs = Job.all
    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
  
  private
  
  def authorized?
    @job = Job.find(params[:id])
    access_denied unless @job.changeable_by?(current_user)
  end
end