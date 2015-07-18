module ApplicationHelper
  def current_user_dev
    return current_user.try(:dev)
  end
end
