require "rails_helper"

RSpec.describe "Recipe Results Index Page" do
  describe "As a Visitor - Sad Path" do
    it "If I visit /recipes without having searched for a recipe first, I am redirected to /recipes/search", :vcr do
      visit "/recipes"

      expect(page).to have_content("Please Enter a Search Parameter")
    end

    it "Returns a notice that no recipes were found for bad search by name", :vcr do
      visit "/recipes/search"

      within "#recipes_search_name" do
        fill_in "Search for Recipe by Name", with: "chili dogs"
        within "#click_button" do
          click_button
        end
      end

      expect(current_path).to eq("/recipes/search")
      expect(page).to have_content("No search results were found.")
    end

    it "Returns a notice that no recipes were found for bad search by ingredient", :vcr do
      visit "/recipes/search"

      within("#recipes_search_ingredient") do
        fill_in "Search for Recipe by Single Ingredient", with: "meteorite"
        within("#click_button") do
          click_button
        end
      end

      expect(current_path).to eq("/recipes/search")
      expect(page).to have_content("No search results were found.")
    end
  end

  describe "As a Visitor - Happy Path" do
    it "returns results for a search by recipe name", :vcr do
      visit "/recipes/search"

      within "#recipes_search_name" do
        fill_in "Search for Recipe by Name", with: "chicken"
        within("#click_button") do
          click_button
        end
      end

      expect(page).to have_content("Search Results For: chicken")

      within "#recipe_id-52795" do
        expect(page).to have_content("Chicken Handi")
      end

      within "#recipe_id-52956" do
        expect(page).to have_content("Chicken Congee")
      end

      within "#recipe_id-52920" do
        expect(page).to have_content("Chicken Marengo")
      end

      within "#recipe_id-52806" do
        expect(page).to have_content("Tandoori chicken")
      end

      within "#recipe_id-52937" do
        expect(page).to have_content("Jerk chicken with rice & peas")
      end
    end

    it "Has results for searching by an ingredient", :vcr do
      visit "/recipes/search"

      within "#recipes_search_ingredient" do
        fill_in "Search for Recipe by Single Ingredient", with: "rice"
        within "#click_button" do
          click_button
        end
      end

      expect(page).to have_content("Search Results For: rice")

      within "#recipe_id-52997" do
        expect(page).to have_content("Beef Banh Mi Bowls with Sriracha Mayo, Carrot & Pickled Cucumber")
      end

      within "#recipe_id-53054" do
        expect(page).to have_content("Seri muka kuih")
      end

      within "#recipe_id-53008" do
        expect(page).to have_content("Stuffed Lamb Tomatoes")
      end

      within "#recipe_id-53027" do
        expect(page).to have_content("Koshari")
      end
    end

    it "Has results for selecting a recipe category", :vcr do
      visit "/recipes/search"

      click_on "Beef"

      within "#recipe_id-52874" do
        expect(page).to have_content("Beef and Mustard Pie")
      end

      within "#recipe_id-52878" do
        expect(page).to have_content("Beef and Oyster pie")
      end

      within "#recipe_id-52997" do
        expect(page).to have_content("Beef Banh Mi Bowls with Sriracha Mayo, Carrot & Pickled Cucumber")
      end

      within "#recipe_id-52992" do
        expect(page).to have_content("Soy-Glazed Meatloaves with Wasabi Mashed Potatoes & Roasted Carrots")
      end
    end

    it "Has results for selecting an area", :vcr do
      visit "/recipes/search"

      click_on "Canadian"

      within "#recipe_id-52928" do
        expect(page).to have_content("BeaverTails")
      end

      within "#recipe_id-52927" do
        expect(page).to have_content("Montreal Smoked Meat")
      end

      within "#recipe_id-52804" do
        expect(page).to have_content("Poutine")
      end

      within "#recipe_id-52929" do
        expect(page).to have_content("Timbits")
      end
    end

    it "Each result is a link to that recipes show page", :vcr do
      visit "/recipes/search"

      within "#recipes_search_name" do
        fill_in "Search for Recipe by Name", with: "steak"
        within "#click_button" do
          click_button
        end
      end
      within "#recipe_id-52935" do
        expect(page).to have_link("Steak Diane")
      end

      within "#recipe_id-52881" do
        click_link "Steak and Kidney Pie"
      end
      expect(current_path).to eq("/recipes/52881")
    end
  end
end
