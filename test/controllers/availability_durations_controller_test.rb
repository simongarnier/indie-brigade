require 'test_helper'

class AvailabilityDurationsControllerTest < ActionController::TestCase
  setup do
    @availability_duration = availability_durations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availability_durations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create availability_duration" do
    assert_difference('AvailabilityDuration.count') do
      post :create, availability_duration: { name: @availability_duration.name }
    end

    assert_redirected_to availability_duration_path(assigns(:availability_duration))
  end

  test "should show availability_duration" do
    get :show, id: @availability_duration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @availability_duration
    assert_response :success
  end

  test "should update availability_duration" do
    patch :update, id: @availability_duration, availability_duration: { name: @availability_duration.name }
    assert_redirected_to availability_duration_path(assigns(:availability_duration))
  end

  test "should destroy availability_duration" do
    assert_difference('AvailabilityDuration.count', -1) do
      delete :destroy, id: @availability_duration
    end

    assert_redirected_to availability_durations_path
  end
end
