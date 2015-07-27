include ApplicationHelper

class DevSkillsController < ApplicationController
  before_action :ensure_current_user_dev
  respond_to :js

  def create
    @dev = current_user_dev
    partial = ""

    if  params[:type] == "major" then
      @dev_skill = DevMajorSkill.find_or_initialize_by(dev_id: @dev.id, skill_id: params[:skill_id])
      partial = '/skills/major'
    elsif  params[:type] == "minor" then
      @dev_skill = DevMinorSkill.find_or_initialize_by(dev_id: @dev.id, skill_id: params[:skill_id])
      partial = '/skills/minor'
    end

    respond_to do |format|
      if @dev_skill.save
        format.json{ render json: { :partial => render_to_string(partial, :layout => false, :locals =>  {skill: @dev_skill}) }}
      else
        format.json { render status: :error}
      end
    end
  end

  private
    def ensure_current_user_dev
      if current_user_dev.nil? then
        respond_to do |format|
          format.json { render status: :error}
        end
      end
    end
end
