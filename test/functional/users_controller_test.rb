require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
    assert_equal User, assigns(:user).class
  end

  def test_create
    User.any_instance.stubs(:save).returns true
    post :create
    assert_redirected_to directory_path
  end

  def test_create_with_bad_attributes
    User.any_instance.stubs(:save).returns false 
    post :create
    assert_template :new
  end
end
