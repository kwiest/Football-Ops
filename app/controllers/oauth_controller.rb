class OauthController < ApplicationController
  before_filter :ensure_authenticated

  def authorize
    @app          = App.find params[:api_key]
    @redirect_uri = params.fetch :redirect_uri, @app.redirect_uri
    @state        = params.fetch :state, ''
  end
end
