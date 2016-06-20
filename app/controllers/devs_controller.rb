class DevsController < ApplicationController
  before_action :ensure_user_is_logged_in, except: [:index, :show]

  def edit
    @dev = current_user_dev
  end

  def update
    input = dev_params
    @dev = current_user_dev
    @dev.user.nested = true
    if input[:availabilities_attributes].nil? then
      @dev.availabilities = []
    else
      keep = input[:availabilities_attributes].values.map{|r| r[:id].to_i}.compact
      @dev.availabilities.reject{|a| keep.include?(a.id) }.each(&:destroy)
    end
    @dev.assign_attributes(input)
    unless input[:condition_ids]
      @dev.conditions = []
    end

    if @dev.save
      redirect_to dev_edit_path
    else
      render template: 'devs/edit'
    end
  end

  # GET /devs
  def index
    @devs = Dev.all
  end

  # GET /devs/1
  def show
    @dev = Dev.find(params[:id])
  end

  def additional_availability
    render json:{
      payload: render_to_string(
        'devs/_availability',
        layout: false,
        locals: {availability: Availability.new(per_week: 2..4)}
      )
    }
  end

  def remove_availability
    @dev = current_user_dev
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
        :portfolio_link,
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
