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
    visit "/oauth/authorize?api_key=#{@app.api_key}"
    click_button 'Allow'
    refute has_content?('DENIED'), 'Echo server should not display "DENIED"'
  end

  def test_denying_authorization
    visit "/oauth/authorize?api_key=#{@app.api_key}"
    click_button 'Deny'
    assert has_content?('DENIED'), 'Echo server should display "DENIED"'
  end
end
