class RecipesService
  def self.conn
    Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.recipes_by_name(name)
    response = conn.get("/api/v1/recipes/search") do |c|
      c.params[:q] = name
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipes_by_ingredient(ingredient)
    response = conn.get("/api/v1/recipes/ingredient") do |c|
      c.params[:q] = ingredient
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipes_by_category(category)
    response = conn.get("/api/v1/recipes/category") do |c|
      c.params[:q] = category
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipes_by_area(area)
    response = conn.get("/api/v1/recipes/area") do |c|
      c.params[:q] = area
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.random_recipe
    response = conn.get("/api/v1/recipes/random_meal")
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipe_by_id(id)
    response = conn.get("/api/v1/recipes/find") do |c|
      c.params[:id] = id
    end
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.user_saved_recipes(user_id)
    response = conn.get("/api/v1/saved_recipes") do |c|
      c.params[:user_id] = user_id
    end
    result = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.save_recipe(recipe_data)
    response = conn.post("/api/v1/saved_recipes") do |c|
      c.params[:user_id] = recipe_data[:user_id]
      c.params[:recipe_id] = recipe_data[:recipe_id]
      c.params[:recipe_name] = recipe_data[:recipe_name]
    end
  end
end
