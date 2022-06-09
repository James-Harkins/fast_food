require "rails_helper"

RSpec.describe RecipesFacade do
  it "Returns recipe poros for find recipes by name search", :vcr do
    recipes = RecipesFacade.find_recipes_by_name("chicken")
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end

  it "Returns recipe poros for find recipes by ingredient", :vcr do
    recipes = RecipesFacade.find_recipes_by_ingredient("rice")
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end

  it "Returns recipe poros for find recipes by category", :vcr do
    recipes = RecipesFacade.find_recipes_by_category("seafood")
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end

  it "Returns recipe poros for find recipes by area", :vcr do
    recipes = RecipesFacade.find_recipes_by_area("Canadian")
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end

  it "returns a recipe poro for some random recipe", :vcr do
    recipe = RecipesFacade.random_recipe
    expect(recipe).to be_a Recipe
  end

  it "returns a recipe poro when given a recipe id", :vcr do
    recipe = RecipesFacade.find_recipe_by_id("52935")
    expect(recipe).to be_a Recipe
  end

  xit "returns recipe poros for all of a given user's saved recipes", :vcr do
    saved_recipes = RecipesFacade.user_saved_recipes(7)
    expect(saved_recipes).to be_all SavedRecipe
    expect(saved_recipes.first.id).to eq("52764")
    expect(saved_recipes.first.name).to eq("Garides Saganaki")
  end
end
