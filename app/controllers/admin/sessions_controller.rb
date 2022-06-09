class Admin::SessionsController < ApplicationController
  def new
    if params[:site_password] != ENV["SITE_PASSWORD"]
      redirect_to "/admin/security_check"
    end
  end
end
