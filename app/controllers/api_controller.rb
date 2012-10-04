class ApiController < ApplicationController
  before_filter :set_custom_response_headers
  before_filter :authenticate_with_token


  private

  def set_custom_response_headers
    if request.request_method == 'OPTIONS'
      response.headers['Cache-Control'] = 'no-cache'
    end
    response.headers['Access-Control-Allow-Headers']   = '*, Content-Type, Authorization'
    response.headers['Access-Control-Allow-Methods']   = 'GET, POST, PUT, OPTIONS'
    response.headers['Access-Control-Allow-Origin']    = '*'
    response.headers['Access-Control-Request-Method']  = '*'
  end

  def authenticate_with_token
    unauthorized_response unless request.headers.has_key? 'HTTP_AUTHORIZATION'
    token = request.headers['Authorization'].split(' ')[1]
    access_token = AccessToken.find_by_token! token
    @current_user = access_token.user
  rescue ActiveRecord::RecordNotFound
    unauthorized_response
  end

  def unauthorized_response
    head :unauthorized
  end

  def current_user
    @current_user ||= authenticate_with_token
  end
end
