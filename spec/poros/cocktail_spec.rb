require "rails_helper"

describe Cocktail do
  it "exists and has attributes" do
    attributes = {
      id: "17206",
      type: "cocktail",
      attributes: {
        name: "Mint Julep",
        image: "https://www.thecocktaildb.com/images/media/drink/squyyq1439907312.jpg",
        ingredients: {
          Mint: "4 fresh ",
          Bourbon: "2 1/2 oz ",
          "Powdered sugar": "1 tsp ",
          Water: "2 tsp "
        },
        instructions: "In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig."
      }
    }

    julep = Cocktail.new(attributes)

    expect(julep).to be_a Cocktail
    expect(julep.id).to eq("17206")
    expect(julep.name).to eq("Mint Julep")
    expect(julep.image).to eq("https://www.thecocktaildb.com/images/media/drink/squyyq1439907312.jpg")
    expect(julep.ingredients).to eq({
      Mint: "4 fresh ",
      Bourbon: "2 1/2 oz ",
      "Powdered sugar": "1 tsp ",
      Water: "2 tsp "
    })
    expect(julep.instructions).to eq("In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.")
  end
end
