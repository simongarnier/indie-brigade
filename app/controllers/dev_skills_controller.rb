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
    @dev = Dev.find(params[:dev_id])
    posted_skills = params[:skills]

    posted_skills.each do |skill_id, level|
      skill_id = skill_id.to_i
      case level
      when "free"
        DevMinorSkill.destroy_all(dev_id: @dev.id, skill_id: skill_id)
        DevMajorSkill.destroy_all(dev_id: @dev.id, skill_id: skill_id)
      when "minor"
        DevMajorSkill.destroy_all(dev_id: @dev.id, skill_id: skill_id)
        DevMinorSkill.new(dev_id: @dev.id, skill_id: skill_id).save!
      when "major"
        DevMinorSkill.destroy_all(dev_id: @dev.id, skill_id: skill_id)
        DevMajorSkill.new(dev_id: @dev.id, skill_id: skill_id).save!
      end
    end

    respond_to do |format|
      format.html { redirect_to @dev, notice: 'Skills where saved sucessfully' }
      format.json { render :show, status: :created, location: @dev }
    end
  end

  # PATCH/PUT /dev_skills/1
  # PATCH/PUT /dev_skills/1.json
  def update
    respond_to do |format|
      if @dev_skill.update(dev_skill_params)
        format.html { redirect_to @dev_skill, notice: 'Dev skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev_skill }
      else
        format.html { render :edit }
        format.json { render json: @dev_skill.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:dev_id)
    end
end
