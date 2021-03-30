module ApplicationHelper
  def admin?
    return true if current_user&.admin == true
  end
end
