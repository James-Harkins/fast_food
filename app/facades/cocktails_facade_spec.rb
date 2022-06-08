require "rails_helper"

describe CocktailsFacade do
  describe "class methods" do
    describe "#find_by_area" do
      it "returns a cocktail PORO based on area input using the CocktailsService#find_by_area class method" do
        drink = CocktailsFacade.find_by_area("American")

        expected_ids = ((drink.id == "17206") || (drink.id == "11001") || (drink.id == "11008"))
        expected_names = ((drink.name == "Mint Julep") || (drink.name == "Old Fashioned") || (drink.name == "Manhattan"))

        expect(expected_ids).to be true
        expect(expected_names).to be true
      end
    end
  end
end
