class SessionsController < ApplicationController
  def create
  end

  def destroy
    session.destroy
    redirect_to "/"
  end
end
