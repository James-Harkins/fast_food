require 'rails_helper'

RSpec.describe RecipesFacade do

  it 'Returns recipe poro area for find recipe by name search', :vcr do
    recipes = RecipesFacade.find_recipe_by_name('beef')
    expect(recipes).to be_an Array
    expect(recipes).to be_all Recipe
  end





end 