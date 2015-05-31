class DevSkillsController < ApplicationController
  before_action :set_dev_skill, only: [:show, :edit, :update, :destroy]

  # GET /dev_skills
  # GET /dev_skills.json
  def index
    @dev_skills = DevSkill.all
  end

  # GET /dev_skills/1
  # GET /dev_skills/1.json
  def show
  end

  # GET /dev_skills/new
  def new
    @dev_skill = DevSkill.new
  end

  # GET /dev_skills/1/edit
  def edit
  end

  # POST /dev_skills
  # POST /dev_skills.json
  def create
    @dev_skill = DevSkill.new(dev_skill_params)

    respond_to do |format|
      if @dev_skill.save
        format.html { redirect_to @dev_skill, notice: 'Dev skill was successfully created.' }
        format.json { render :show, status: :created, location: @dev_skill }
      else
        format.html { render :new }
        format.json { render json: @dev_skill.errors, status: :unprocessable_entity }
      end
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
      @dev_skill = DevSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_skill_params
      params.require(:dev_skill).permit(:dev_id, :skill_id)
    end
end
