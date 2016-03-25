class DevsController < ApplicationController
  before_action :ensure_dev_owned_by_current_user, only: [:edit, :update, :availabilities_with_additionnals, :remove_availability]

  def edit
    @dev = Dev.find(params[:id])
  end

  def update
    input = dev_params
    @dev = Dev.find(params[:id])
    ids = @dev.availability_ids
    if input[:availabilities_attributes].nil? then
      @dev.availabilities = []
    else
      keep = input[:availabilities_attributes].values.map{|r| r[:id].to_i}.compact
      @dev.availabilities.reject{|a| keep.include?(a.id) }.each(&:destroy)
    end
    @dev.update(input)
    if !input[:condition_ids] then
      @dev.conditions = []
      @dev.save
    end
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

  def availabilities_with_additionnals
    @dev = Dev.find(params[:id])
    amount = params[:amount]
    amount ||= 1

    render json: {
      payload: render_to_string(
        'devs/_availabilities',
        layout: false,
        locals: { dev: @dev, availabilities: @dev.availabilities + amount.to_i.times.map{ Availability.new(per_week: 2..4) } }
        )
    }
  end

  def remove_availability
    @dev = Dev.find(params[:id])
    availability_id = params[:availability_id]
    if availability_id

      availability = Availability.find(availability_id)

      if @dev.availabilities.destroy(availability) then
        render json: {
          status: :ok
        }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def dev_params
      params.require(:dev).permit(
        :id,
        :description,
        :avatar,
        :banner,
        :main_skill_id,
        :facebook_handle,
        :google_handle,
        :tumblr_handle,
        :youtube_handle,
        :behance_handle,
        :instagram_handle,
        :twitter_handle,
        :deviantart_handle,
        :skype_handle,
        :vimeo_handle,
        :pinterest_handle,
        :linkedin_link,
        {condition_ids: []},
        {languages: []},
        {major_skill_ids: []},
        {minor_skill_ids: []},
        {software_ids: []},
        availabilities_attributes: [:per_week_lower, :per_week_upper, :project_size_id, :for_number_of_weeks, :id],
        user_attributes: [:firstname, :lastname, :id])
    end
end
