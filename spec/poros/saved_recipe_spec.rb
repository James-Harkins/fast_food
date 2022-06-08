require "rails_helper"

describe SavedRecipe do
  it "exists and has attributes" do
    attributes = {
      id: 7,
      type: "saved_recipes",
      attributes: {
        user_id: 7,
        recipe_name: "Garides Saganaki",
        recipe_id: "52764"
      }
    }

    recipe = SavedRecipe.new(attributes)

    expect(recipe).to be_a SavedRecipe
    expect(recipe.name).to eq("Garides Saganaki")
    expect(recipe.id).to eq("52764")
  end
end
