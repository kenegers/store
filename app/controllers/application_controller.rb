class ApplicationController < ActionController::Base
  private

  def admin?
  	return if current_user&.admin == true
  	redirect_to root_path
  end
end
