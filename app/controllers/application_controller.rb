class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    user = UserFacade.find_by_email(session[:email]) if session[:email]
  end

  def current_admin
    admin = Admin.find_by(id: session[:admin_id])
  end
end
