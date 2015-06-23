class DevSkillsController < ApplicationController

  # POST /dev_skills
  # POST /dev_skills.json
  def create
    @dev = Dev.find(params[:dev_id])
    posted_skills = params[:skills]

    DevMinorSkill.where(dev_id: @dev.id).destroy_all
    DevMajorSkill.where(dev_id: @dev.id).destroy_all

    posted_skills.each do |skill_id, level|
      skill_id = skill_id.to_i
      case level
      when "minor"
        DevMinorSkill.new(dev_id: @dev.id, skill_id: skill_id).save!
      when "major"
        DevMajorSkill.new(dev_id: @dev.id, skill_id: skill_id).save!
      end
    end

    respond_to do |format|
      format.html { redirect_to @dev, notice: 'Skills where saved sucessfully' }
      format.json { render :show, status: :created, location: @dev }
    end
  end

  private
    def dev_skill_params
      params.require(:dev_id)
    end
end
