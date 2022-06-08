class SavedRecipesController < ApplicationController
  def create
    recipe_params = {
      user_id: params[:user_id],
      recipe_id: params[:recipe_id],
      recipe_name: params[:recipe_name]
    }
    RecipesService.save_recipe(recipe_params)
    redirect_to "/dashboard"
  end
end
