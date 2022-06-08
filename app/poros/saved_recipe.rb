class SavedRecipe
  attr_reader :id, :name
  def initialize(attributes)
    @id = attributes[:attributes][:recipe_id]
    @name = attributes[:attributes][:recipe_name]
  end
end
