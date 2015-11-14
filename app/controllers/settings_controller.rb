include ApplicationHelper

class SettingsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:edit]

  def edit_skills
    @skills = Skill.all
    @major_skills = current_user.dev.major_skills
    @minor_skills = current_user.dev.minor_skills
  end

  def update_skills

  end
end
