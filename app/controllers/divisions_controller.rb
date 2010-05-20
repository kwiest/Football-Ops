class DivisionsController < InheritedResources::Base
  before_filter :sign_in_required
  before_filter :admin_required, :except => [:index, :show]
  actions :all
  respond_to :html, :xml, :json
end