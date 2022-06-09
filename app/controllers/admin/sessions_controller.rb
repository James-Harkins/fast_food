class Admin::SessionsController < ApplicationController
  def new
    # binding.pry
    if params[:site_password] && (params[:site_password] != ENV["SITE_PASSWORD"])
      redirect_to "/admin/security_check?bypassing=true"
    elsif !params[:site_password] && params[:bypassed] != "true"
      redirect_to "/admin/security_check"
      flash[:unathorized] = "You must input the site password in order to access the Admin Login page."
    end
  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to "/admin/dashboard"
    else
      redirect_to "/admin/login?bypassed=true"
      flash[:incorrect_credentials] = "Incorrect Credentials."
    end
  end
end
