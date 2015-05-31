require 'test_helper'

class DevSoftwaresControllerTest < ActionController::TestCase
  setup do
    @dev_software = dev_softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dev_softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dev_software" do
    assert_difference('DevSoftware.count') do
      post :create, dev_software: { dev_id: @dev_software.dev_id, software_id: @dev_software.software_id }
    end

    assert_redirected_to dev_software_path(assigns(:dev_software))
  end

  test "should show dev_software" do
    get :show, id: @dev_software
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dev_software
    assert_response :success
  end

  test "should update dev_software" do
    patch :update, id: @dev_software, dev_software: { dev_id: @dev_software.dev_id, software_id: @dev_software.software_id }
    assert_redirected_to dev_software_path(assigns(:dev_software))
  end

  test "should destroy dev_software" do
    assert_difference('DevSoftware.count', -1) do
      delete :destroy, id: @dev_software
    end

    assert_redirected_to dev_softwares_path
  end
end
