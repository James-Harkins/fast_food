require "rails_helper"

describe "recipe show page" do
  describe "as a logged-in user" do
    describe "when i visit a recipe show page" do
      before do
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        visit "/"

        click_button "Log In With Google"
      end

      it "i see a link to save that recipe", :vcr do
        visit "/recipes/52803"

        click_button "Save This Recipe"

        expect(current_path).to eq("/dashboard")
        within "#saved_recipes_container" do
          expect(page).to have_link("Beef Wellington")
        end
      end
    end
  end

  describe "as a visitor" do
    describe "when i visit a recipe show page" do
      it "i do not see a link to save that recipe", :vcr do
        visit "/recipes/52803"

        expect(page).not_to have_button "Save This Recipe"
      end

      it "i see a button to pair this recipe with a cocktail", :vcr do
        visit "/recipes/52803"

        click_button "Pair With A Cocktail"

        expect(current_path).to eq("/recipes/52803")
    

        expect(page).to have_content("Gin Fizz")
      end
    end
  end
end
