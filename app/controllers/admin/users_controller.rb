class Admin::UsersController < ApplicationController
  def destroy
    UserService.delete_user(params[:email])
    redirect_to "/admin/dashboard"
  end
end
