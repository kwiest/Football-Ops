class ConferencesController < InheritedResources::Base
  before_filter :sign_in_required
  actions :all, :except => [:destroy]
  respond_to :html, :xml, :json
end
