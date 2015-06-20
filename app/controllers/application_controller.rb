class ApplicationController < ActionController::Base
  include Clearance::Controller
  before_action  :require_login, only: [:create, :new, :edit, :update, :destroy]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_user_is_admin
    redirect_to sign_in_path unless current_user.try(:is_admin?)
  end
end
