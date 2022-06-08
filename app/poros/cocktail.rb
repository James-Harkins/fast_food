class Cocktail
  attr_reader :id, :name, :image, :ingredients, :instructions
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name]
    @image = attributes[:attributes][:image]
    @ingredients = attributes[:attributes][:ingredients]
    @instructions = attributes[:attributes][:instructions]
  end
end
