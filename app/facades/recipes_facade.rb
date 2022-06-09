class RecipesFacade
  def self.find_recipes_by_name(name)
    if results = RecipesService.recipes_by_name(name)
      results.map do |result|
        Recipe.new(result)
      end
    else
      "No search results found."
    end
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

  def self.random_recipe
    recipe_data = RecipesService.random_recipe
    Recipe.new(recipe_data)
  end

  def self.find_recipe_by_id(id)
    recipe_data = RecipesService.recipe_by_id(id)
    Recipe.new(recipe_data)
  end

  def self.user_saved_recipes(user_id)
    saved_recipes = RecipesService.user_saved_recipes(user_id)
    saved_recipes.map { |recipe| SavedRecipe.new(recipe) }
  end
end
