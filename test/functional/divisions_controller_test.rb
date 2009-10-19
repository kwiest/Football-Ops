require 'test_helper'

class DivisionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:divisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create divisions" do
    assert_difference('Divisions.count') do
      post :create, :divisions => { }
    end

    assert_redirected_to divisions_path(assigns(:divisions))
  end

  test "should show divisions" do
    get :show, :id => divisions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => divisions(:one).to_param
    assert_response :success
  end

  test "should update divisions" do
    put :update, :id => divisions(:one).to_param, :divisions => { }
    assert_redirected_to divisions_path(assigns(:divisions))
  end

  test "should destroy divisions" do
    assert_difference('Divisions.count', -1) do
      delete :destroy, :id => divisions(:one).to_param
    end

    assert_redirected_to divisions_path
  end
end
