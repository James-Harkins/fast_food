require 'rails_helper'

RSpec.describe "Recipe Search Page" do

  describe "As a Visitor" do
    
    it 'On the Recipes::Search index page I see a serach field for searching a meal by name' do
      visit '/recipes/search'
      
      expect(page).to have_content("Search for a Recipe")
      within("#recipes_search_name") do
        fill_in "search for recipe by name", with: 'Chili dogs'
        click_button "Search"
      end 
    end 

  end 
end 