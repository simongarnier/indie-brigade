class DevsController < ApplicationController
  # GET /devs
  def index
    @devs = Dev.all
  end

  # GET /devs/1
  def show
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
