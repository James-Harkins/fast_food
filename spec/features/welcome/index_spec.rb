require "rails_helper"

describe "landing page" do
  describe "as a visitor" do
    describe "when i visit the root path" do
      it "i see the name of the app" do
        visit "/"

        expect(page).to have_content("FAST FOOD")
      end

      it "i see a button to browse recipes, which redirects me to the recipes::search page" do
        visit "/"

        click_button "Browse Recipes"

        expect(current_path).to eq("/recipes/search")
      end

      it "i see a button to login, which redirects me to the login page", :vcr do
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        visit "/"

        click_button "Log In With Google"

        expect(current_path).to eq("/dashboard")
      end
    end
  end
end
