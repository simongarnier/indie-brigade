class DevsController < ApplicationController
  before_action :set_dev, only: [:show, :edit, :update, :destroy]

  # GET /devs
  # GET /devs.json
  def index
    @devs = Dev.all
  end

  # GET /devs/1
  # GET /devs/1.json
  def show
  end

  # GET /devs/new
  def new
    @dev = Dev.new
  end

  # GET /devs/1/edit
  def edit
  end

  # POST /devs
  # POST /devs.json
  def create
    @dev = Dev.new(dev_params)

    respond_to do |format|
      if @dev.save
        format.html { redirect_to @dev, notice: 'Dev was successfully created.' }
        format.json { render :show, status: :created, location: @dev }
      else
        format.html { render :new }
        format.json { render json: @dev.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devs/1
  # PATCH/PUT /devs/1.json
  def update
    respond_to do |format|
      if @dev.update(dev_params)
        format.html { redirect_to @dev, notice: 'Dev was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev }
      else
        format.html { render :edit }
        format.json { render json: @dev.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devs/1
  # DELETE /devs/1.json
  def destroy
    @dev.destroy
    respond_to do |format|
      format.html { redirect_to devs_url, notice: 'Dev was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev
      @dev = Dev.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_params
      params.require(:dev).permit(:name, :description, :role_id, :availability_id)
    end
end
