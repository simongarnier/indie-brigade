class CustomSessionsController < Clearance::SessionsController
  def url_after_create
    if current_user.is_admin?
      redirect_to admin_dashboard_url and return
    end
  end
end
