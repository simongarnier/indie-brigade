include ApplicationHelper

class SkillsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:destroy, :create]

  def index
    @dev = Dev.find(params[:dev_id])
    @skills_by_role = Skill.all.group_by(&:role)
    @minor_skills = @dev.minor_skills
    @major_skills = @dev.major_skills
    @main_skill = @dev.main_skill
    if @dev.user_id == current_user.try(:id) then
      render "index_edit"
    else
      render "index"
    end
  end

  def destroy
    @dev = Dev.find(params[:dev_id])
    @skill = Skill.find(params[:id])
    success = false
    @dev_major_skill = DevMajorSkill.find_by(dev_id: @dev.id, skill_id: @skill.id)
    success = @dev_major_skill.try(:save) || success
    @dev_minor_skill = DevMinorSkill.find_by(dev_id: @dev.id, skill_id: @skill.id)
    success = @dev_minor_skill.try(:save) || success
    @dev.main_skill = nil
    success = @dev.save || success


    respond_to do |format|
      if success then
        format.json { render json: {message: "Success"} }
      else
        format.json { render json: {eror: "nothing to delete"} }
      end
    end
  end

  def create
    @dev = Dev.find(params[:dev_id])
    partial = ""
    success = false

    if  params[:type] == "major" then
      @dev_skill = DevMajorSkill.new(dev_id: @dev.id, skill_id: params[:skill_id])
      success = @dev_skill.save
      skill = @dev_skill.skill
      partial = '_major.html.erb'
    elsif  params[:type] == "minor" then
      @dev_skill = DevMinorSkill.new(dev_id: @dev.id, skill_id: params[:skill_id])
      success = @dev_skill.save
      skill = @dev_skill.skill
      partial = '_minor.html.erb'
    elsif params[:type] == "main" then
      @dev.main_skill_id = params[:skill_id]
      success = @dev.save
      skill = @dev.main_skill
      partial = '_main.html.erb'
    end

    respond_to do |format|
      if success
        format.json{ render json: { partial: render_to_string(partial, layout: false, locals: {skill: skill, dev: @dev}) }}
      else
        format.json { render status: :error}
      end
    end
  end


  private
    def ensure_dev_owned_by_current_user
      if params[:dev_id].to_s != current_user_dev.id.to_s
        redirect_to sign_in_path
      end
    end
end
