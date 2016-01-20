class ApplicationController < ActionController::Base
  include Clearance::Controller
  include ApplicationHelper
  #before_action  :require_login, only: [:create, :new, :edit, :update, :destroy]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_user_is_logged_in
    redirect_to sign_in_path and return unless current_user
  end

  def ensure_user_is_admin
    redirect_to sign_in_path and return unless current_user.try(:is_admin?)
  end

  def ensure_user_is_super_admin
    redirect_to sign_in_path and return unless current_user.try(:is_admin?) && current_user.try(:is_super_admin?)
  end

  def ensure_dev_owned_by_current_user
    if params[:id].to_s != current_user_dev.id.to_s
      redirect_to sign_in_path and return
    end
  end

end
