class AvailabilityPerWeeksController < ApplicationController
  before_action :set_availability_per_week, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_is_admin

  # GET /availability_per_weeks
  # GET /availability_per_weeks.json
  def index
    @availability_per_weeks = AvailabilityPerWeek.all
  end

  # GET /availability_per_weeks/1
  # GET /availability_per_weeks/1.json
  def show
  end

  # GET /availability_per_weeks/new
  def new
    @availability_per_week = AvailabilityPerWeek.new
  end

  # GET /availability_per_weeks/1/edit
  def edit
  end

  # POST /availability_per_weeks
  # POST /availability_per_weeks.json
  def create
    @availability_per_week = AvailabilityPerWeek.new(availability_per_week_params)

    respond_to do |format|
      if @availability_per_week.save
        format.html { redirect_to @availability_per_week, notice: 'Availability per week was successfully created.' }
        format.json { render :show, status: :created, location: @availability_per_week }
      else
        format.html { render :new }
        format.json { render json: @availability_per_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availability_per_weeks/1
  # PATCH/PUT /availability_per_weeks/1.json
  def update
    respond_to do |format|
      if @availability_per_week.update(availability_per_week_params)
        format.html { redirect_to @availability_per_week, notice: 'Availability per week was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability_per_week }
      else
        format.html { render :edit }
        format.json { render json: @availability_per_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availability_per_weeks/1
  # DELETE /availability_per_weeks/1.json
  def destroy
    @availability_per_week.destroy
    respond_to do |format|
      format.html { redirect_to availability_per_weeks_url, notice: 'Availability per week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability_per_week
      @availability_per_week = AvailabilityPerWeek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_per_week_params
      params.require(:availability_per_week).permit(:name)
    end
end
