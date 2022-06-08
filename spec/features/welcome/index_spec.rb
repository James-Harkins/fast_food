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
end
