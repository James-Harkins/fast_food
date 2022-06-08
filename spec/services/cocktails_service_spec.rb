require "rails_helper"

describe CocktailsService do
  describe "class methods" do
    describe "#find_by_area" do
      it "returns cocktail data based on an area paramter" do
        drink = CocktailsService.find_by_area("American")

        expected_ids = ((drink[:id] == "17206") || (drink[:id] == "11001") || (drink[:id] == "11008"))
        expected_names = ((drink[:attributes][:name] == "Mint Julep") || (drink[:attributes][:name] == "Old Fashioned") || (drink[:attributes][:name] == "Manhattan"))

        expect(expected_ids).to be true
        expect(expected_names).to be true
      end
    end
  end
end
