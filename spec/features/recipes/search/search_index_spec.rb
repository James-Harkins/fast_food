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
        fill_in "Search for Recipe by Name", with: 'Gabagool'
          within("#click_button") do
          click_button
        end 
      end 
       expect(current_path).to eq('/recipes')
    end 

  end 
end 