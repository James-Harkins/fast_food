class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    binding.pry
    UserFacade.find_by_email(session[:email]) if session[:email]
  end
end
