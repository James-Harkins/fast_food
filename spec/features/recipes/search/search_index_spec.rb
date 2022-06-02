require 'rails_helper'

RSpec.describe "Recipe Search Page" do

  describe "As a Visitor" do
    
    it 'On the Recipes::Search index page I see a serach field for searching a meal by name' do
      visit '/recipes/search'
      save_and_open_page
      expect(page).to have_content("Search for a Recipe")
      within("#recipes_search_name") do
        fill_in "Search for Recipe by Name", with: 'Chili dogs'
        find(".search_by_name").click

        
      end 
    end 

  end 
end 