class Recipe
  attr_reader :id, :name, :category, :area, :image, :ingredients, :instructions

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name]
    @category = attributes[:attributes][:category]
    @area = attributes[:attributes][:area]
    @image = attributes[:attributes][:image]
    @ingredients = attributes[:attributes][:ingredients]
    @instructions = attributes[:attributes][:instructions]


  end 

  def instruction_steps
    @instructions.split('.').map do |instruction|
      instruction.gsub("\r\n", " ")
    end
  end
  


end 