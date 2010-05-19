class SchoolsController < InheritedResources::Base
  before_filter :sign_in_required
  actions :index, :show
  respond_to :html, :xml, :json
  
  def search
    @schools = School.name_like(params[:name]).paginate(:page => params[:page], :per_page => 30)
    flash[:notice] = "Sorry, no schools found with a name like: #{params[:name]}." unless @schools.size > 0
  end
  
  private
  
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 30)
      @schools = end_of_association_chain.paginate(paginate_options)
    end
end