require 'test_helper'

class DevConditionsControllerTest < ActionController::TestCase
  setup do
    @dev_condition = dev_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dev_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dev_condition" do
    assert_difference('DevCondition.count') do
      post :create, dev_condition: { condition_id: @dev_condition.condition_id, dev_id: @dev_condition.dev_id }
    end

    assert_redirected_to dev_condition_path(assigns(:dev_condition))
  end

  test "should show dev_condition" do
    get :show, id: @dev_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dev_condition
    assert_response :success
  end

  test "should update dev_condition" do
    patch :update, id: @dev_condition, dev_condition: { condition_id: @dev_condition.condition_id, dev_id: @dev_condition.dev_id }
    assert_redirected_to dev_condition_path(assigns(:dev_condition))
  end

  test "should destroy dev_condition" do
    assert_difference('DevCondition.count', -1) do
      delete :destroy, id: @dev_condition
    end

    assert_redirected_to dev_conditions_path
  end
end
