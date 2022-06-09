class AdminController < ApplicationController
  def index
    if !current_admin
      redirect_to "/admin/security_check"
      flash[:unathorized] = "You must input the site password in order to access the Admin Login page."
    end
  end

  def new
  end

  def create
    if params[:bypassed]
      admin = User.new(user_params)
      if user.save
        redirect_to "/login"
      else
        redirect_to "/register"
        flash[:notice] = user.errors.full_messages.to_sentence
      end
    else
      redirect_to "/admin/security_check"
      flash[:unathorized] = "You must input the site password in order to access the Admin Login page."
    end
  end
end
