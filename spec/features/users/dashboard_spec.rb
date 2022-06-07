require "rails_helper"

describe "as a logged-in user" do
  describe "when i visit the user dashboard page" do
    before do
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

      visit "/"

      click_button "Log In With Google"
    end

    it "i see my name listed", :vcr do
      expect(page).to have_content("Example User")
    end

    it "i see a button to browse recipes, which redirects me to the /recipes/search page", :vcr do
      click_link "Search Recipes"

      expect(current_path).to eq("/recipes/search")
    end

    it "i see a button for a random recipe, which redirects me to the /recipes/search page", :vcr do
      click_link "Random Recipe"

      expect(current_path).to eq("/recipes/random")
    end

    it "i see a list of all of my saved recipes, which are links to their show pages", :vcr do
      within "#saved_recipes" do
        expect(page).to have_link("Garides Saganaki")
        expect(page).to have_link("Apple & Blackberry Crumble")
        expect(page).to have_link("Beef Lo Mein")
      end
    end
  end
end
