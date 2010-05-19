class Admin::UsersController < InheritedResources::Base
  before_filter :admin_required
  actions :all
  respond_to :html, :xml, :json
  
  private
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 30)
      @users = end_of_association_chain.paginate(paginate_options)
    end
end