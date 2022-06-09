class Admin::SecurityController < ApplicationController
  def new
    if params[:bypassing]
      flash[:incorrect_passowrd] = "Incorrect Password."
    end
  end
end
