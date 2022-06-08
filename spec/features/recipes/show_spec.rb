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

        within "#saved_recipes" do
          expect(page).to have_link("Beef Wellington")
        end
      end
    end
  end
end
