class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    UserService.find_by_email(session[:email]) if session[:email]
  end
end
