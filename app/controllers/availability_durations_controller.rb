class AvailabilityDurationsController < ApplicationController
  before_action :set_availability_duration, only: [:show, :edit, :update, :destroy]

  # GET /availability_durations
  # GET /availability_durations.json
  def index
    @availability_durations = AvailabilityDuration.all
  end

  # GET /availability_durations/1
  # GET /availability_durations/1.json
  def show
  end

  # GET /availability_durations/new
  def new
    @availability_duration = AvailabilityDuration.new
  end

  # GET /availability_durations/1/edit
  def edit
  end

  # POST /availability_durations
  # POST /availability_durations.json
  def create
    @availability_duration = AvailabilityDuration.new(availability_duration_params)

    respond_to do |format|
      if @availability_duration.save
        format.html { redirect_to @availability_duration, notice: 'Availability duration was successfully created.' }
        format.json { render :show, status: :created, location: @availability_duration }
      else
        format.html { render :new }
        format.json { render json: @availability_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availability_durations/1
  # PATCH/PUT /availability_durations/1.json
  def update
    respond_to do |format|
      if @availability_duration.update(availability_duration_params)
        format.html { redirect_to @availability_duration, notice: 'Availability duration was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability_duration }
      else
        format.html { render :edit }
        format.json { render json: @availability_duration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availability_durations/1
  # DELETE /availability_durations/1.json
  def destroy
    @availability_duration.destroy
    respond_to do |format|
      format.html { redirect_to availability_durations_url, notice: 'Availability duration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability_duration
      @availability_duration = AvailabilityDuration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_duration_params
      params.require(:availability_duration).permit(:name)
    end
end
