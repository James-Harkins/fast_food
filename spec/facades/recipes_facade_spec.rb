require 'rails_helper'

RSpec.describe RecipesFacade do

  it 'Returns recipe poros for find recipes by name search', :vcr do
    recipes = RecipesFacade.find_recipes_by_name('chicken')
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end

  it 'Returns recipe poros for find recipes by ingredient', :vcr do
    recipes = RecipesFacade.find_recipes_by_ingredient('rice')
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe

  end 

  it 'Returns recipe poros for find recipes by category', :vcr do
    recipes = RecipesFacade.find_recipes_by_category('seafood')
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe

  end 



end 