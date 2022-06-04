class RecipesFacade

  def self.find_recipes_by_name(name)
    results = RecipesService.recipe_by_name(name)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 
end 