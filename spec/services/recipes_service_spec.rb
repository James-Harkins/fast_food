require "rails_helper"

RSpec.describe RecipesService do
  describe "class methods" do
    describe "#random_recipe" do
      it "returns data for a random recipe", :vcr do
        recipe = RecipesService.random_recipe

        expect(recipe).to be_a Hash
        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to have_key(:name)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes]).to have_key(:ingredients)
        expect(recipe[:attributes][:ingredients]).to be_a(Hash)
        expect(recipe[:attributes]).to have_key(:instructions)
        expect(recipe[:attributes]).to have_key(:category)
        expect(recipe[:attributes]).to have_key(:area)
      end
    end

    it "Returns data for a recipe by given id", :vcr do
      recipe = RecipesService.recipe_by_id("52764")
      expect(recipe).to be_a Hash
      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to have_key(:name)
      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes]).to have_key(:ingredients)
      expect(recipe[:attributes][:ingredients]).to be_a(Hash)
      expect(recipe[:attributes]).to have_key(:instructions)
      expect(recipe[:attributes]).to have_key(:category)
      expect(recipe[:attributes]).to have_key(:area)
    end

    it "Returns data for a recipe search by name", :vcr do
      recipes = RecipesService.recipes_by_name("meat")
      expect(recipes).to be_an Array
      expect(recipes.first).to be_a Hash
      expect(recipes.first).to have_key(:id)
      expect(recipes.first).to have_key(:attributes)
      expect(recipes.first[:attributes]).to have_key(:name)
      expect(recipes.first[:attributes]).to have_key(:image)
      expect(recipes.first[:attributes]).to have_key(:ingredients)
      expect(recipes.first[:attributes][:ingredients]).to be_a(Hash)
      expect(recipes.first[:attributes]).to have_key(:instructions)
      expect(recipes.first[:attributes]).to have_key(:category)
      expect(recipes.first[:attributes]).to have_key(:area)
    end

    it "Returns data for a recipe search by ingredient", :vcr do
      recipes = RecipesService.recipes_by_ingredient("cheese")
      expect(recipes).to be_an Array
      expect(recipes.first).to be_a Hash
      expect(recipes.first).to have_key(:id)
      expect(recipes.first).to have_key(:attributes)
      expect(recipes.first[:attributes]).to have_key(:name)
      expect(recipes.first[:attributes]).to have_key(:image)
    end

    it "Returns data for a recipe search by category", :vcr do
      recipes = RecipesService.recipes_by_category("Seafood")
      expect(recipes).to be_an Array
      expect(recipes.first).to be_a Hash
      expect(recipes.first).to have_key(:id)
      expect(recipes.first).to have_key(:attributes)
      expect(recipes.first[:attributes]).to have_key(:name)
      expect(recipes.first[:attributes]).to have_key(:image)
      expect(recipes.first[:attributes]).to have_key(:ingredients)
      expect(recipes.first[:attributes][:ingredients]).to be_a(Hash)
      expect(recipes.first[:attributes]).to have_key(:instructions)
      expect(recipes.first[:attributes]).to have_key(:category)
      expect(recipes.first[:attributes]).to have_key(:area)
    end

    it "Returns data for a recipe search by area", :vcr do
      recipes = RecipesService.recipes_by_area("Croatian")
      expect(recipes).to be_an Array
      expect(recipes.first).to be_a Hash
      expect(recipes.first).to have_key(:id)
      expect(recipes.first).to have_key(:attributes)
      expect(recipes.first[:attributes]).to have_key(:name)
      expect(recipes.first[:attributes]).to have_key(:image)
      expect(recipes.first[:attributes]).to have_key(:ingredients)
      expect(recipes.first[:attributes][:ingredients]).to be_a(Hash)
      expect(recipes.first[:attributes]).to have_key(:instructions)
      expect(recipes.first[:attributes]).to have_key(:category)
      expect(recipes.first[:attributes]).to have_key(:area)
    end

    describe "#user_saved_recipes" do
      it "returns data for all of a given users saved recipes", :vcr do
        saved_recipes = RecipesService.user_saved_recipes(7)

        expect(saved_recipes).to be_an Array
        expect(saved_recipes.first).to be_a Hash
        expect(saved_recipes.first).to have_key(:id)
        expect(saved_recipes.first).to have_key(:attributes)
        expect(saved_recipes.first[:attributes]).to have_key(:user_id)
        expect(saved_recipes.first[:attributes]).to have_key(:recipe_id)
        expect(saved_recipes.first[:attributes]).to have_key(:recipe_name)
      end
    end

    describe "#save_recipe" do
      it "sends a post request to the back-end to create a saved recipe for some user", :vcr do
        saved_recipe_data = {
          user_id: "1",
          recipe_name: "Garides Saganaki",
          recipe_id: "52764"
        }
        response = RecipesService.save_recipe(saved_recipe_data)

        expect(response).to be_a(Faraday::Response)
      end
    end
  end
end
