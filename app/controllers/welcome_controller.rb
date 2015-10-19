class WelcomeController < ApplicationController
  before_action :ensure_user_is_logged_in, only: [:edit, :update]

  def show
    if params[:role_id] && current_user then
      role = Role.fetch(params[:role_id])
      if role && current_user.dev then
        current_user.dev.role = role
        if current_user.dev.save
          redirect_to welcome_edit_path
        end
      end
    end

    redirect_to sign_up_path if !current_user
    redirect_to welcome_edit_path if current_user && !current_user.dev.try(:role)
  end

  def edit
    @user = current_user
    @roles = Role.all

    if !@user.dev
      #no dev associate to this user, create one
      @user.dev = Dev.new
      @user.dev.save
      @user.save
    end

    @role = @user.dev.role
  end
end
