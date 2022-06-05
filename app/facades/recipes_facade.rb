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

  def self.find_recipes_by_category(category)
    results = RecipesService.recipes_by_category(category)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 

  def self.find_recipes_by_area(area)
    results = RecipesService.recipes_by_area(area)
    recipes = []
    results.each do |result|
      recipes << Recipe.new(result)
    end 
    recipes
  end 
end 