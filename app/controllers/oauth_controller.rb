class OauthController < ApplicationController
  before_filter :ensure_authenticated,  only: %w(authorize)
  before_filter :find_app_by_client_id, only: %w(authorize create_authorization_code)
  before_filter :extract_params,        only: %w(authorize create_authorization_code)

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_request_response

  def authorize
  end

  def create_authorization_code
    if params[:authorize] == 'true'
      authorization_code = @app.create_authorization_code_for_user current_user
      response_query = URI.encode_www_form 'code' => authorization_code.code, 'state' => @state
      @redirect_uri << "?#{response_query}"
    else
      response_query = URI.encode_www_form 'error' => { 'access_denied' => true }, 'state' => @state
      @redirect_uri << "?#{response_query}"
    end

    redirect_to @redirect_uri
  end

  def create_access_token
    if params[:grant_type] == 'authorization_code'
      authenticate_app
      code = @app.authorization_codes.find_by_code! params[:code]
      access_token = @app.create_access_token_from_authorization_code code
      render json: access_token, root: false
    else
      invalid_request_response
    end
  end


  private

  def extract_params
    @redirect_uri = params.fetch :redirect_uri, @app.redirect_uri
    @state        = params.fetch :state, ''
  end

  def find_app_by_client_id
    @app = App.find_by_client_id! params[:client_id]
  end

  def authenticate_app
    authenticate_with_http_basic do |username, password|
      @app = App.find_by_client_id! username
      invalid_request_response unless @app.client_secret == password
    end
  end

  def invalid_request_response
    json_response = { 'error' => { 'invalid_request' => true }, 'state' => @state }.to_json
    render json: json_response, status: 422
  end
end
