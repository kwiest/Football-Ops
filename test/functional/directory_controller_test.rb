require 'test_helper'

class DirectoryControllerTest < ActionController::TestCase
  def test_authentication_required
    get :index
    assert_redirected_to sign_in_path
    assert_equal 'You must be signed-in to access this page.', flash[:alert]
  end
end
