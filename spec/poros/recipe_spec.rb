require 'rails_helper'

RSpec.describe Recipe do

  it 'exists and has readable attributes' do
    data = {
            "type": "recipe",
            "id": "1",
            "attributes": {
                  "name": "Beef Wellington",
                  "category": "Beef",
                  "area": "British",
                  "image": "[image url]",
                  "ingredients": {
                        "mushrooms": "400g",
                        "English Mustard": "1-2 tbsp",
                        "Olive Oil": "Dash",
                        "Beef Fillet": "750g piece",
                        "Parma ham": "6-8 slices",
                        "Puff Pastry": "500g",
                        "Flour": "Dusting",
                        "Egg Yolks": "2 Beaten"
                  },
                  "instructions": "Rinse the baingan (eggplant or aubergine) in water. Pat dry with a kitchen napkin. Apply some oil all over and\r\nkeep it for roasting on an open flame. You can also grill the baingan or roast in the oven. But then you won't       get\r\nthe smoky flavor of the baingan. Keep the eggplant turning after a 2 to 3 minutes on the flame, so that its evenly\r\ncooked. You could also embed some garlic cloves in the baingan and then roast it.\r\n2. Roast the aubergine till its completely cooked and tender. With a knife check the doneness. The knife should slid\r\neasily in aubergines without any resistance. Remove the baingan and immerse in a bowl of water till it cools\r\ndown.\r\n3. You can also do the dhungar technique of infusing charcoal smoky flavor in the baingan. This is an optional step.\r\nUse natural charcoal for this method. Heat a small piece of charcoal on flame till it becomes smoking hot and red.\r\n4. Make small cuts on the baingan with a knife. Place the red hot charcoal in the same plate where the roasted\r\naubergine is kept. Add a few drops of oil on the charcoal. The charcoal would begin to smoke.\r\n5. As soon as smoke begins to release from the charcoal, cover the entire plate tightly with a large bowl. Allow the\r\ncharcoal smoke to get infused for 1 to 2 minutes. The more you do, the more smoky the baingan bharta will\r\nbecome. I just keep for a minute. Alternatively, you can also do this dhungar method once the baingan bharta is\r\ncooked, just like the way we do for Dal Tadka.\r\n6. Peel the skin from the roasted and smoked eggplant.\r\n7. Chop the cooked eggplant finely or you can even mash it.\r\n8. In a kadai or pan, heat oil. Then add finely chopped onions and garlic.\r\n9. Saute the onions till translucent. Don't brown them.\r\n10. Add chopped green chilies and saute for a minute.\r\n11. Add the chopped tomatoes and mix it well.\r\n12. Bhuno (saute) the tomatoes till the oil starts separating from the mixture.\r\n13. Now add the red chili powder. Stir and mix well.\r\n14. Add the chopped cooked baingan.\r\n15. Stir and mix the chopped baingan very well with the oniontomato masala mixture.\r\n16. Season with salt. Stir and saute for some more 4 to 5 minutes more.\r\n17. Finally stir in the coriander leaves with the baingan bharta or garnish it with them. Serve Baingan Bharta with\r\nphulkas, rotis or chapatis. It goes well even with bread, toasted or grilled bread and plain rice or jeera rice."
            }
          }
    recipe = Recipe.new(data)
    expect(recipe).to be_a Recipe
    expect(recipe.id).to eq("1")
    expect(recipe.name).to eq("Beef Wellington")
    expect(recipe.category).to eq('Beef')
    expect(recipe.area).to eq("British")
    expect(recipe.image).to eq("[image url]")
    expect(recipe.ingredients).to be_a Hash
    expect(recipe.instructions).to eq(data[:attributes][:instructions])

  end 



end 