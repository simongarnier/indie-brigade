class OpeningSkillsController < ApplicationController
  before_action :set_opening_skill, only: [:show, :edit, :update, :destroy]

  # GET /opening_skills
  # GET /opening_skills.json
  def index
    @opening_skills = OpeningSkill.all
  end

  # GET /opening_skills/1
  # GET /opening_skills/1.json
  def show
  end

  # GET /opening_skills/new
  def new
    @opening_skill = OpeningSkill.new
  end

  # GET /opening_skills/1/edit
  def edit
  end

  # POST /opening_skills
  # POST /opening_skills.json
  def create
    @opening_skill = OpeningSkill.new(opening_skill_params)

    respond_to do |format|
      if @opening_skill.save
        format.html { redirect_to @opening_skill, notice: 'Opening skill was successfully created.' }
        format.json { render :show, status: :created, location: @opening_skill }
      else
        format.html { render :new }
        format.json { render json: @opening_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opening_skills/1
  # PATCH/PUT /opening_skills/1.json
  def update
    respond_to do |format|
      if @opening_skill.update(opening_skill_params)
        format.html { redirect_to @opening_skill, notice: 'Opening skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @opening_skill }
      else
        format.html { render :edit }
        format.json { render json: @opening_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opening_skills/1
  # DELETE /opening_skills/1.json
  def destroy
    @opening_skill.destroy
    respond_to do |format|
      format.html { redirect_to opening_skills_url, notice: 'Opening skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening_skill
      @opening_skill = OpeningSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opening_skill_params
      params.require(:opening_skill).permit(:opening_id, :skill_id)
    end
end
