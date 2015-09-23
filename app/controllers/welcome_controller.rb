class WelcomeController < ApplicationController
  before_action :ensure_user_is_logged_in, only: [:edit, :update]

  def show
    redirect_to welcome_edit_path if current_user && !current_user.dev.try(:role)
    render 'thanks' if current_user.dev.try(:role)
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

  def update
    dev = current_user.dev
    role = Role.find(params[:role_id])

    if role && dev
      dev.role = role
      if dev.save
        redirect_to welcome_path
      end
    end
  end
end
