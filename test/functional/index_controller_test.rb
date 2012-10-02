require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  def test_no_authentication_required
    get :index
    assert_response :success
  end
end
