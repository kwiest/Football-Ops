class OauthController < ApplicationController
  before_filter :ensure_authenticated
  before_filter :find_app_by_api_key, only: %w(authorize create_authorization_code)

  def authorize
    @redirect_uri = params.fetch :redirect_uri, @app.redirect_uri
    @state        = params.fetch :state, ''
  end

  def create_authorization_code
    app_redirect_uri = params[:redirect_uri]
    state            = params[:state]

    if params[:authorize] == 'true'
      authorization_code = @app.create_authorization_code_for_user current_user
      redirect_uri = "#{app_redirect_uri}?authorization_code=#{authorization_code.code}&state=#{state}"
    else
      redirect_uri = "#{app_redirect_uri}?authorization_code=DENIED&state=#{state}"
    end

    redirect_to redirect_uri
  end


  private

  def find_app_by_api_key
    @app = App.find_by_api_key! params[:api_key]
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Sorry, but we could not find that application'
  end
end
