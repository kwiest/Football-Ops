require 'test_helper'

class DeveloperControllerTest < ActionController::TestCase
  def test_no_authentication_required
    env = Rack::MockRequest.env_for '/developer/index'
    response = DeveloperController.action(:index).call env
    assert_equal 200, response[0]
  end
end

