require 'test_helper'

class OauthFlowTest < ActionDispatch::IntegrationTest
  def setup
    @kyle = users :kyle; @kyle.password = 'secret'
    @app  = apps :ios
    sign_in @kyle
  end

  def test_authorizing_an_app
    visit "/oauth/authorize?api_key=#{@app.api_key}"
    @app.expects :create_authorization_code
    click_button 'Allow'
    assert_redirected_to @app.redirect_uri
  end
end
