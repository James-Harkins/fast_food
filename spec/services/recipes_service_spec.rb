require "rails_helper"

describe RecipeService do
  describe "class methods" do
    describe "#random_recipe" do
      it "returns data for a random recipe" do
        recipe = RecipeService.random_recipe

        expect(recipe).to be_a Hash
        expect(recipe[:data]).to be_a Hash
        expect(recipe[:data]).to have_key(:id)
        expect(recipe[:data]).to have_key(:attributes)
        expect(recipe[:data][:attributes]).to have_key(:name)
        expect(recipe[:data][:attributes]).to have_key(:image)
        expect(recipe[:data][:attributes]).to have_key(:ingredients)
        expect(recipe[:data][:attributes][:ingredients]).to be_a(Hash)
        expect(recipe[:data][:attributes]).to have_key(:instructions)
        expect(recipe[:data][:attributes]).to have_key(:category)
        expect(recipe[:data][:attributes]).to have_key(:area)
      end
    end
  end
end
