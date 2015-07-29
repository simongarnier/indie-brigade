include ApplicationHelper

class SkillsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:destroy, :create]

  def index
    @dev = Dev.find(params[:dev_id])
    @skills_by_role = Skill.all.group_by(&:role)
    @minor_skills = @dev.minor_skills
    @major_skills = @dev.major_skills
    if @dev.user_id == current_user.try(:id) then
      render "index_edit"
    else
      render "index"
    end
  end

  def destroy
    @dev = Dev.find(params[:dev_id])
    @skill = Skill.find(params[:id])
    @dev_major_skill = DevMajorSkill.find_by(dev_id: @dev.id, skill_id: @skill.id)
    @dev_minor_skill = DevMinorSkill.find_by(dev_id: @dev.id, skill_id: @skill.id)

    respond_to do |format|
      if @dev_major_skill.try(:destroy) || @dev_minor_skill.try(:destroy) then
        format.json { render json: {message: "Success"} }

      else
        format.json { render json: {eror: "nothing to delete"} }
      end
    end
  end

  def create
    @dev = Dev.find(params[:dev_id])
    partial = ""

    if  params[:type] == "major" then
      @dev_skill = DevMajorSkill.new(dev_id: @dev.id, skill_id: params[:skill_id])
      partial = '_major.html.erb'
    elsif  params[:type] == "minor" then
      @dev_skill = DevMinorSkill.new(dev_id: @dev.id, skill_id: params[:skill_id])
      partial = '_minor.html.erb'
    end

    respond_to do |format|
      if @dev_skill.save
        format.json{ render json: { partial: render_to_string(partial, layout: false, locals: {skill: @dev_skill.skill, dev: @dev}) }}
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
