require 'test_helper'

class OpeningSoftwaresControllerTest < ActionController::TestCase
  setup do
    @opening_software = opening_softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opening_softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opening_software" do
    assert_difference('OpeningSoftware.count') do
      post :create, opening_software: { opening_id: @opening_software.opening_id, software_id: @opening_software.software_id }
    end

    assert_redirected_to opening_software_path(assigns(:opening_software))
  end

  test "should show opening_software" do
    get :show, id: @opening_software
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opening_software
    assert_response :success
  end

  test "should update opening_software" do
    patch :update, id: @opening_software, opening_software: { opening_id: @opening_software.opening_id, software_id: @opening_software.software_id }
    assert_redirected_to opening_software_path(assigns(:opening_software))
  end

  test "should destroy opening_software" do
    assert_difference('OpeningSoftware.count', -1) do
      delete :destroy, id: @opening_software
    end

    assert_redirected_to opening_softwares_path
  end
end
