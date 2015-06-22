class DevSkillsController < ApplicationController
  before_action :set_dev_skill, only: [:show, :edit, :update, :destroy]

  # GET /dev_skills
  # GET /dev_skills.json
  def index
    @dev_major_skills = DevMajorSkill.all
    @dev_minor_skills = DevMinorSkill.all
  end

  # GET /dev_skills/1
  # GET /dev_skills/1.json
  def show
  end

  # GET /dev_skills/new
  def new
    @dev_skill = DevMajorSkill.new
  end

  # GET /dev_skills/1/edit
  def edit
  end

  # POST /dev_skills
  # POST /dev_skills.json
  def create
    p params
  end

  # PATCH/PUT /dev_skills/1
  # PATCH/PUT /dev_skills/1.json
  def update
    p params
  end

  # DELETE /dev_skills/1
  # DELETE /dev_skills/1.json
  def destroy
    @dev_skill.destroy
    respond_to do |format|
      format.html { redirect_to dev_skills_url, notice: 'Dev skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_skill
      @dev_skill = DevMajorSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_skill_params
      params.require(:dev_skill).permit(:dev_id, :major_skill_ids, :minor_skill_ids)
    end
end
