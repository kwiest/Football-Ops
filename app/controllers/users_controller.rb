class UsersController < InheritedResources::Base
  before_filter :sign_in_required, :except => [:new, :create]
  before_filter :authorized?, :only => [:edit, :update]
  before_filter :admin_required, :only => :destroy
  actions :all
  respond_to :html, :xml, :json
  
  def conference_reps
  	@users = User.find_all_by_conference_rep(true)
  end
  
  def national_committee
  	@users = User.find_all_by_national_committee(true)
  end
  
  def search
    @users = User.last_name_like(params[:last_name]).paginate(:page => params[:page], :per_page => 30)
  	flash[:notice] = "Sorry, no users found by last name: #{params[:last_name]}." unless @users.size > 0
  end
  
  def subscribe_to_newsletter
    @user = User.find(params[:id])
    @user.subscribe_to_newsletter!
    flash[:notice] = "You've successfully subscribed to the DFO newsletter."
    redirect_to @user
  end
  
  def unsubscribe_from_newsletter
    @user = User.find(params[:id])
    @user.unsubscribe_from_newsletter!
    flash[:notice] = "You've successfully unsubscribed to the DFO newsletter. Please reconsider, the newsletter has lots of important and useful information."
    redirect_to @user
  end
  
  
  private
  
    def authorized?
      @user = User.find(params[:id])
      @user.changeable_by?(current_user) || access_denied
    end
  
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 30)
      @users = end_of_association_chain.paginate(paginate_options)
    end
end
