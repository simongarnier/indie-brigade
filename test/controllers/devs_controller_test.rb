require 'test_helper'

class DevsControllerTest < ActionController::TestCase
  setup do
    @dev = devs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dev" do
    assert_difference('Dev.count') do
      post :create, dev: { availability_id: @dev.availability_id, description: @dev.description, name: @dev.name, role_id: @dev.role_id }
    end

    assert_redirected_to dev_path(assigns(:dev))
  end

  test "should show dev" do
    get :show, id: @dev
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dev
    assert_response :success
  end

  test "should update dev" do
    patch :update, id: @dev, dev: { availability_id: @dev.availability_id, description: @dev.description, name: @dev.name, role_id: @dev.role_id }
    assert_redirected_to dev_path(assigns(:dev))
  end

  test "should destroy dev" do
    assert_difference('Dev.count', -1) do
      delete :destroy, id: @dev
    end

    assert_redirected_to devs_path
  end
end
