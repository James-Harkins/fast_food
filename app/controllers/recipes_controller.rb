class RecipesController < ApplicationController

  def index
    
    if params[:area].blank? && params[:category].blank? && params[:name].blank? && params[:ingredient].blank?
      flash[:error] = "Please Enter a Search Parameter"
      redirect_to "/recipes/search"
    end 
  end
  
  
end 