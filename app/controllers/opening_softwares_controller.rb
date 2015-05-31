class OpeningSoftwaresController < ApplicationController
  before_action :set_opening_software, only: [:show, :edit, :update, :destroy]

  # GET /opening_softwares
  # GET /opening_softwares.json
  def index
    @opening_softwares = OpeningSoftware.all
  end

  # GET /opening_softwares/1
  # GET /opening_softwares/1.json
  def show
  end

  # GET /opening_softwares/new
  def new
    @opening_software = OpeningSoftware.new
  end

  # GET /opening_softwares/1/edit
  def edit
  end

  # POST /opening_softwares
  # POST /opening_softwares.json
  def create
    @opening_software = OpeningSoftware.new(opening_software_params)

    respond_to do |format|
      if @opening_software.save
        format.html { redirect_to @opening_software, notice: 'Opening software was successfully created.' }
        format.json { render :show, status: :created, location: @opening_software }
      else
        format.html { render :new }
        format.json { render json: @opening_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opening_softwares/1
  # PATCH/PUT /opening_softwares/1.json
  def update
    respond_to do |format|
      if @opening_software.update(opening_software_params)
        format.html { redirect_to @opening_software, notice: 'Opening software was successfully updated.' }
        format.json { render :show, status: :ok, location: @opening_software }
      else
        format.html { render :edit }
        format.json { render json: @opening_software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opening_softwares/1
  # DELETE /opening_softwares/1.json
  def destroy
    @opening_software.destroy
    respond_to do |format|
      format.html { redirect_to opening_softwares_url, notice: 'Opening software was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening_software
      @opening_software = OpeningSoftware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opening_software_params
      params.require(:opening_software).permit(:opening_id, :software_id)
    end
end
