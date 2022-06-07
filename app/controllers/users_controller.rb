class UsersController < ApplicationController
  def new
    oauth_response = request.env["omniauth.auth"]
    user_data = {}
    user_data[:name] = oauth_response["info"]["name"]
    user_data[:email] = oauth_response["info"]["email"]
    binding.pry
    UserService.create_user(user_data)
    session[:email] = user_data[:email]
    redirect_to "/dashboard"
  end

  def show
  end
end
