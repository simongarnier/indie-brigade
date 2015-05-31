require 'test_helper'

class AvailabilityPerWeeksControllerTest < ActionController::TestCase
  setup do
    @availability_per_week = availability_per_weeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:availability_per_weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create availability_per_week" do
    assert_difference('AvailabilityPerWeek.count') do
      post :create, availability_per_week: { name: @availability_per_week.name }
    end

    assert_redirected_to availability_per_week_path(assigns(:availability_per_week))
  end

  test "should show availability_per_week" do
    get :show, id: @availability_per_week
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @availability_per_week
    assert_response :success
  end

  test "should update availability_per_week" do
    patch :update, id: @availability_per_week, availability_per_week: { name: @availability_per_week.name }
    assert_redirected_to availability_per_week_path(assigns(:availability_per_week))
  end

  test "should destroy availability_per_week" do
    assert_difference('AvailabilityPerWeek.count', -1) do
      delete :destroy, id: @availability_per_week
    end

    assert_redirected_to availability_per_weeks_path
  end
end
