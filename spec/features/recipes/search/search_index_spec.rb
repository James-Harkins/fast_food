require 'rails_helper'

RSpec.describe "Recipe Search Page" do

  describe "As a Visitor" do
    
    it 'On the Recipes::Search index page I see a serach field for searching a meal by name', :vcr do
      visit '/recipes/search'
    
      expect(page).to have_content("Search for a Recipe")
      within("#recipes_search_name") do
        fill_in "Search for Recipe by Name", with: 'chicken'
        within("#click_button") do
          click_button
        end 
      end 
      expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a serach field for searching a meal by an ingredient', :vcr do
      visit '/recipes/search'
      # save_and_open_page
      within("#recipes_search_ingredient") do
        fill_in "Search for Recipe by Single Ingredient", with: 'chicken'
          within("#click_button") do
          click_button
        end 
      end 
      expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a drop down field for selecting a category', :vcr do
      visit '/recipes/search'
      
       click_on "Pasta"
    
      expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a drop down field for selecting an area', :vcr do
      visit '/recipes/search'
      
      click_on "Vietnamese"
      expect(current_path).to eq('/recipes')

    end 

  end 
end 
