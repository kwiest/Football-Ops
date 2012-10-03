require 'test_helper'

class OauthFlowTest < ActionDispatch::IntegrationTest
  def setup
    # Allow Capybara to access remote URLs
    Capybara.current_driver = :webkit

    @kyle = users :kyle; @kyle.password = 'secret'
    @app  = apps :ios
    sign_in @kyle
  end

  def teardown
    reset_session!
    Capybara.use_default_driver
  end

  # This is setup with a simple sinatra client server which
  # simply echo params back. Server is running at same URI
  # as defined in fixtures/apps.yml
  def test_authorizing_an_app
    visit "/oauth/authorize?client_id=#{@app.client_id}"
    click_button 'Allow'
    assert has_content?('code'), 'Client should receive an authorization code'
  end

  def test_denying_authorization
    visit "/oauth/authorize?client_id=#{@app.client_id}"
    click_button 'Deny'
    assert has_content?('access_denied'), 'Client should receive access_denied error'
  end

  def test_invalid_request_response
    visit '/oauth/authorize?client_id=bad'
    assert has_content?('invalid_request'), 'Server should display invalid_request error'
  end

  def test_requesting_access_token_with_proper_credentials
    #code = @app.create_authorization_code_for_user @kyle
    #user = @app.client_id
    #pass = @app.client_secret
    #auth = ActionController::HttpAuthentication::Basic.encode_credentials user, pass

    #post '/oauth/token', { 'grant_type' => 'authorization_code', 'code' => code }.to_json,
      #{ 'HTTP_AUTHORIZATION' => auth, 'HTTP_CONTENT_TYPE' => 'application/json' }
    #assert_response :success
  end
end
