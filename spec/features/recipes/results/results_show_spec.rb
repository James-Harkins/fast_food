require 'rails_helper'

RSpec.describe "Recipe Results Show Page" do

  describe "As a Visitor - Happy Path" do

    it 'Shows recipe details when clicking a recipe from the results index' do
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
      # expect(current_path).to eq("/recipes/result")
      expect(page).to have_content("Rappie Pie")
      
      expect(page).to have_content("Ingredients")
      within "#ingredients" do
        expect(page).to have_content("Butter: 2 tbs")    
        expect(page).to have_content("Onions: 2 chopped")    
        expect(page).to have_content("Chicken Stock: 4 qt")    
        expect(page).to have_content("Chicken Breast: 1.5kg")    
        expect(page).to have_content("Potatoes: 4kg")    
        expect(page).to have_content("Salt: 2 tbs")    
        expect(page).to have_content("Black Pepper: 1tbsp")    
      end 

      expect(page).to have_content("Instructions")
      within "#ingredients" do
        expect(page).to have_content("Preheat oven to 400 degrees F (200 degrees C). Grease a 10x14x2-inch baking pan")    
        expect(page).to have_content("ake in the preheated oven until golden brown, about 1 hour. Reheat chicken broth; pour over individual servings as desired.")    
      end 

    end




  end 
end 