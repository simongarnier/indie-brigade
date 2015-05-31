class DevSoftwaresController < ApplicationController
  before_action :set_dev_software, only: [:show, :edit, :update, :destroy]

  # GET /dev_softwares
  # GET /dev_softwares.json
  def index
    @dev_softwares = DevSoftware.all
  end

  # GET /dev_softwares/1
  # GET /dev_softwares/1.json
  def show
  end

  # GET /dev_softwares/new
  def new
    @dev_software = DevSoftware.new
  end

  # GET /dev_softwares/1/edit
  def edit
  end

  # POST /dev_softwares
  # POST /dev_softwares.json
  def create
    @dev_software = DevSoftware.new(dev_software_params)

    respond_to do |format|
      if @dev_software.save
        format.html { redirect_to @dev_software, notice: 'Dev software was successfully created.' }
        format.json { render :show, status: :created, location: @dev_software }
      else
        format.html { render :new }
        format.json { render json: @dev_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dev_softwares/1
  # PATCH/PUT /dev_softwares/1.json
  def update
    respond_to do |format|
      if @dev_software.update(dev_software_params)
        format.html { redirect_to @dev_software, notice: 'Dev software was successfully updated.' }
        format.json { render :show, status: :ok, location: @dev_software }
      else
        format.html { render :edit }
        format.json { render json: @dev_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dev_softwares/1
  # DELETE /dev_softwares/1.json
  def destroy
    @dev_software.destroy
    respond_to do |format|
      format.html { redirect_to dev_softwares_url, notice: 'Dev software was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dev_software
      @dev_software = DevSoftware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_software_params
      params.require(:dev_software).permit(:dev_id, :software_id)
    end
end
