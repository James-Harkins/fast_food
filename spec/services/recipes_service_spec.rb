require "rails_helper"

RSpec.describe RecipesService do
  describe "class methods" do
    describe "#random_recipe" do
      it "returns data for a random recipe", :vcr do
        recipe = RecipesService.random_recipe

        expect(recipe).to be_a Hash
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

    it 'Returns data for a recipe by given id', :vcr do
      recipe = RecipesService.recipe_by_id("52764")
        expect(recipe).to be_a Hash
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
end
