class DevsController < ApplicationController
  def edit
    @dev = Dev.find(params[:id])
  end

  def update
    @dev = Dev.find(params[:id])
    @dev.avatar = dev_params[:avatar]
    @dev.save!
    redirect_to edit_dev_path
  end

  # GET /devs
  def index
    @devs = Dev.all
  end

  # GET /devs/1
  def show
    @dev = Dev.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_params
      params.require(:dev).permit(:name, :description, :role_id, :avatar)
    end
end
