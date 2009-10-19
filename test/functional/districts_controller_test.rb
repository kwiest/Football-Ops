require 'test_helper'

class DistrictsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create districts" do
    assert_difference('Districts.count') do
      post :create, :districts => { }
    end

    assert_redirected_to districts_path(assigns(:districts))
  end

  test "should show districts" do
    get :show, :id => districts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => districts(:one).to_param
    assert_response :success
  end

  test "should update districts" do
    put :update, :id => districts(:one).to_param, :districts => { }
    assert_redirected_to districts_path(assigns(:districts))
  end

  test "should destroy districts" do
    assert_difference('Districts.count', -1) do
      delete :destroy, :id => districts(:one).to_param
    end

    assert_redirected_to districts_path
  end
end
