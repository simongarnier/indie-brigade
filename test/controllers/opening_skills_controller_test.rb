require 'test_helper'

class OpeningSkillsControllerTest < ActionController::TestCase
  setup do
    @opening_skill = opening_skills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opening_skills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opening_skill" do
    assert_difference('OpeningSkill.count') do
      post :create, opening_skill: { opening_id: @opening_skill.opening_id, skill_id: @opening_skill.skill_id }
    end

    assert_redirected_to opening_skill_path(assigns(:opening_skill))
  end

  test "should show opening_skill" do
    get :show, id: @opening_skill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opening_skill
    assert_response :success
  end

  test "should update opening_skill" do
    patch :update, id: @opening_skill, opening_skill: { opening_id: @opening_skill.opening_id, skill_id: @opening_skill.skill_id }
    assert_redirected_to opening_skill_path(assigns(:opening_skill))
  end

  test "should destroy opening_skill" do
    assert_difference('OpeningSkill.count', -1) do
      delete :destroy, id: @opening_skill
    end

    assert_redirected_to opening_skills_path
  end
end
