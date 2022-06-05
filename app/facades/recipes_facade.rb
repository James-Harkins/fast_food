class RecipesFacade

  def self.find_recipes_by_name(name)
    results = RecipesService.recipes_by_name(name)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 

  def self.find_recipes_by_ingredient(ingredient)
    results = RecipesService.recipes_by_ingredient(ingredient)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 
end 