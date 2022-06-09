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
    elsif params[:category]
      @query = params[:category]
      @recipes = RecipesFacade.find_recipes_by_category(@query)
    elsif params[:area]
      @query = params[:area]
      @recipes = RecipesFacade.find_recipes_by_area(@query)
    end
  end

  def show
    @recipe = if params[:id] == "random"
      RecipesFacade.random_recipe
    else
      RecipesFacade.find_recipe_by_id(params[:id])
    end
    if params[:area]
      @cocktail = CocktailsFacade.find_by_area(params[:area])
    end
  end
end
