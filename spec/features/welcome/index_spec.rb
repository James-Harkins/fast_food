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
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]

        visit "/"

        click_button "Log In With Google"

        expect(current_path).to eq("/dashboard")
      end

      # it "i see a button to view a random recipe, which redirects me to some random recipe show page" do
      #
      # end
    end
  end

  # describe "as a logged-in user" do
  #   describe "when i visit the root path" do
  #     it "i do not see a button to become a user or a button to log in" do
  #       visit "/"
  #
  #       expect(page).not_to have_button("Register")
  #       expect(page).not_to have_button("Log In")
  #     end
  #
  #     it "i see a button to log out, which redirects me back to the root path and i see it as a visitor" do
  #       visit "/"
  #
  #       click_button "Log Out"
  #
  #       expect(current_path).to eq("/")
  #       expect(page).to have_button("Register")
  #       expect(page).to have_button("Log In")
  #     end
  #
  #     it "i see a button to return to my dashboard page" do
  #       visit "/"
  #
  #       click_button "My Dashboard"
  #
  #       expect(current_path).to eq("/dashboard")
  #     end
  #   end
  # end
end
