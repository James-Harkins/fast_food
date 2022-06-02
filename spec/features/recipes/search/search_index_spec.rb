require 'rails_helper'

RSpec.describe "Recipe Search Page" do

  describe "As a Visitor" do
    
    it 'On the Recipes::Search index page I see a serach field for searching a meal by name' do
      visit '/recipes/search'
    
      expect(page).to have_content("Search for a Recipe")
      within("#recipes_search_name") do
        fill_in "Search for Recipe by Name", with: 'Chili dogs'
        within("#click_button") do
          click_button
        end 
      end 
      expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a serach field for searching a meal by an ingredient' do
      visit '/recipes/search'

      within("#recipes_search_ingredient") do
        fill_in "Search for Recipe by Single Ingredient", with: 'Gabagool'
          within("#click_button") do
          click_button
        end 
      end 
       expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a drop down field for selecting a category' do
      visit '/recipes/search'
      save_and_open_page
      within("#recipes_select_category") do
        select 'Beef', from: 'Category'
      end 
      within("#recipes_select_category") do
        select 'Vegan', from: 'Category'
      end 
      within("#recipes_select_category") do
        select 'Side', from: 'Category'
          within("#click_button") do
            click_button
        end 
      end 
      expect(current_path).to eq('/recipes')
    end 

  end 
end 
# Beef
# Breakfast
# Chicken
# Dessert
# Goat
# Lamb
# Miscellaneous
# Pasta
# Pork
# Seafood
# Side
# Starter
# Vegan
# Vegetarian