class RecipeFacade

  def self.find_recipe_by_name(name)
    results = RecipesService.recipe_by_name(name)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 
end 