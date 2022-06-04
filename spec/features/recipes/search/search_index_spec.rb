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
      # save_and_open_page
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

      within(".category_drop_down") do
        select 'Beef', from: 'category'
      end 
      within(".category_drop_down") do
        select 'Vegan', from: 'category'
      end 
      within(".category_drop_down") do
        select 'Side', from: 'category'
          click_button "Search"
      end 
      expect(current_path).to eq('/recipes')
    end 

    it 'On the Recipes::Search index page I see a drop down field for selecting an area' do
      visit '/recipes/search'
      
      within(".area_drop_down") do
        select 'Chinese', from: 'area'
      end 
      within(".area_drop_down") do
        select 'Irish', from: 'area'
      end 
      within(".area_drop_down") do
        select 'Vietnamese', from: 'area'
          click_button "Search"
      end 
      expect(current_path).to eq('/recipes')


    end 

  end 
end 
