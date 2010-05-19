class DivisionsController < InheritedResources::Base
  before_filter :sign_in_required
  actions :index, :show
  respond_to :html, :xml, :json
end