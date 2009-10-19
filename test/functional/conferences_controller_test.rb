require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conferences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conferences" do
    assert_difference('Conferences.count') do
      post :create, :conferences => { }
    end

    assert_redirected_to conferences_path(assigns(:conferences))
  end

  test "should show conferences" do
    get :show, :id => conferences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => conferences(:one).to_param
    assert_response :success
  end

  test "should update conferences" do
    put :update, :id => conferences(:one).to_param, :conferences => { }
    assert_redirected_to conferences_path(assigns(:conferences))
  end

  test "should destroy conferences" do
    assert_difference('Conferences.count', -1) do
      delete :destroy, :id => conferences(:one).to_param
    end

    assert_redirected_to conferences_path
  end
end
