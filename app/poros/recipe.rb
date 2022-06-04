class Recipe
  attr_reader :id, :name, :category, :area, :image, :ingredients, :instructions

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @category = data[:attributes][:category]
    @area = data[:attributes][:area]
    @image = data[:attributes][:image]
    @ingredients = data[:attributes][:ingredients]
    @instructions = data[:attributes][:instructions]


  end 


end 