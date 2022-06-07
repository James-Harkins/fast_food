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
    end
  end
  describe "as a logged-in user" do
    describe "when i visit the root path" do
      it "i see a button to login, which redirects me to the google oauth2 page and then to my dashboard", :vcr do
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        visit "/"

        click_button "Log In With Google"

        expect(current_path).to eq("/dashboard")
      end

      it "after logging in, if i visit the landing page, i no longer see a button to log in and i see a button to log out", :vcr do
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        visit "/"

        click_button "Log In With Google"

        visit "/"

        expect(page).to have_button("Log Out")
        expect(page).not_to have_button("Log In With Google")
      end
    end
  end
end
