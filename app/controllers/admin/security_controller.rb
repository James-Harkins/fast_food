class Admin::SecurityController < ApplicationController
  def new
    flash[:incorrect_passowrd] = "Incorrect Password."
  end
end
