class Admin::UsersController < InheritedResources::Base
  before_filter :admin_required
  actions :all
  respond_to :html, :xml, :json
  
  def search
    @users = User.last_name_like(params[:last_name]).paginate(:page => params[:page], :per_page => 30)
    flash[:notice] = "Sorry, no users found by last name: #{params[:last_name]}." unless @users.size > 0
  end
  
  private
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 30)
      @users = end_of_association_chain.paginate(paginate_options)
    end
end