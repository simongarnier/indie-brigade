require 'test_helper'

class DevMajorSkillsControllerTest < ActionController::TestCase
  setup do
    @dev_skill = dev_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dev_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dev_skill" do
    assert_difference('DevSkill.count') do
      post :create, dev_skill: { dev_id: @dev_skill.dev_id, skill_id: @dev_skill.skill_id }
    end

    assert_redirected_to dev_skill_path(assigns(:dev_skill))
  end

  test "should show dev_skill" do
    get :show, id: @dev_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dev_skill
    assert_response :success
  end

  test "should update dev_skill" do
    patch :update, id: @dev_skill, dev_skill: { dev_id: @dev_skill.dev_id, skill_id: @dev_skill.skill_id }
    assert_redirected_to dev_skill_path(assigns(:dev_skill))
  end

  test "should destroy dev_skill" do
    assert_difference('DevSkill.count', -1) do
      delete :destroy, id: @dev_skill
    end

    assert_redirected_to dev_skills_path
  end
end
