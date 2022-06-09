class AdminController < ApplicationController
  def index
    if !current_admin
      redirect_to "/admin/security_check"
      flash[:unathorized] = "You must input the site password in order to access the Admin Login page."
    else
      @users = UserFacade.get_all_users
    end
  end

  def new
    if !params[:bypassed]
      redirect_to "/admin/security_check"
      flash[:unathorized] = "You must input the site password in order to access the Admin Login page."
    end
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      redirect_to "/admin/security_check"
      flash[:success] = "Admin successfully created. Please re-submit the Site Password and proceed to Admin Login."
    else
      redirect_to "/admin/new?bypassed=true"
      flash[:notice] = admin.errors.full_messages.to_sentence
    end
  end

  private

  def admin_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
