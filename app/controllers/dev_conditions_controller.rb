class DevConditionsController < ApplicationController
  before_action :set_dev_condition, only: [:show, :edit, :update, :destroy]

  # GET /dev_conditions
  # GET /dev_conditions.json
  def index
    @dev_conditions = DevCondition.all
  end

  # GET /dev_conditions/1
  # GET /dev_conditions/1.json
  def show
  end

  # GET /dev_conditions/new
  def new
    @dev_condition = DevCondition.new
  end

  # GET /dev_conditions/1/edit
  def edit
  end

  # POST /dev_conditions
  # POST /dev_conditions.json
  def create
    @dev_condition = DevCondition.new(dev_condition_params)

    respond_to do |format|
      if @dev_condition.save
        format.html { redirect_to @dev_condition, notice: 'Dev condition was successfully created.' }
        format.json { render :show, status: :created, location: @dev_condition }
      else
        format.html { render :new }
        format.json { render json: @dev_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_conditions/1
  # PATCH/PUT /dev_conditions/1.json
  def update
    respond_to do |format|
      if @dev_condition.update(dev_condition_params)
        format.html { redirect_to @dev_condition, notice: 'Dev condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev_condition }
      else
        format.html { render :edit }
        format.json { render json: @dev_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_conditions/1
  # DELETE /dev_conditions/1.json
  def destroy
    @dev_condition.destroy
    respond_to do |format|
      format.html { redirect_to dev_conditions_url, notice: 'Dev condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_condition
      @dev_condition = DevCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_condition_params
      params.require(:dev_condition).permit(:dev_id, :condition_id)
    end
end
