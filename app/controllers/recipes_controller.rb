class RecipesController < ApplicationController

  def index

    if params[:area].blank? && params[:category].blank? && params[:name].blank? && params[:ingredient].blank?
      flash[:error] = "Please Enter a Search Parameter"
      redirect_to "/recipes/search"
      
    elsif params[:name]
      @query = params[:name]
      @recipes = RecipesFacade.find_recipes_by_name(@query)
      
    elsif params[:ingredient]
      @query = params[:ingredient]
      @recipes = RecipesFacade.find_recipes_by_ingredient(@query)
    end 

  
  end
  
  
end 