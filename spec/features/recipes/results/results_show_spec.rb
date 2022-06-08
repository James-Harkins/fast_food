require 'rails_helper'

RSpec.describe "Recipe Results Show Page" do

  describe "As a Visitor - Happy Path" do

    it 'Shows recipe details when clicking a recipe from the results index', :vcr do
      visit '/recipes/search'

      within("#recipes_search_name") do
        fill_in "Search for Recipe by Name", with: 'pie'
        within("#click_button") do
          click_button
        end 
      end 

      within "#recipe_id-52933" do
        click_link "Rappie Pie"
      end
    
      expect(current_path).to eq("/recipes/52933")
      expect(page).to have_content("Rappie Pie")
      
      expect(page).to have_content("Ingredients")
      within "#ingredients" do
        expect(page).to have_content("Butter:")    
        expect(page).to have_content("2 tbs")    
        expect(page).to have_content("Onions:")    
        expect(page).to have_content("2 chopped")    
        expect(page).to have_content("Chicken Stock:")    
        expect(page).to have_content("4 qt")    
        expect(page).to have_content("Chicken Breast:")    
        expect(page).to have_content("1.5kg")    
        expect(page).to have_content("Potatoes:")    
        expect(page).to have_content("4kg")    
        expect(page).to have_content("Salt:")    
        expect(page).to have_content("2 tbs")    
        expect(page).to have_content("Black Pepper:")    
        expect(page).to have_content("1tbsp")    
      end 

      expect(page).to have_content("Instructions")
      within "#instructions" do
        expect(page).to have_content("Preheat oven to 400 degrees F (200 degrees C)")    
      end 
    end




  end 


end 