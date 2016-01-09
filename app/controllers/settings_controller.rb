include ApplicationHelper

class SettingsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:edit_skills, :update_skills]

  def edit_skills
    @skills = Skill.all.group_by(&:role)
    @major_skills = current_user.dev.major_skills
    @minor_skills = current_user.dev.minor_skills
  end

  def update_skills
    major_skills = params[:major] || []
    minor_skills = params[:minor] || []
    minor_skills = minor_skills - major_skills
    dev = Dev.find(params[:dev_id])
    DevMinorSkill.find_by(dev_id: dev.id).try(:delete)
    DevMajorSkill.find_by(dev_id: dev.id).try(:delete)
    major_skills.each{ |major| DevMajorSkill.new(dev: dev, skill_id:major).save }
    minor_skills.each{ |minor| DevMinorSkill.new(dev: dev, skill_id:minor).save }
    redirect_to setting_edit_skills_path
  end

  def search
  end
end
