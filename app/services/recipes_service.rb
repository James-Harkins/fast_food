class RecipesService 

  def self.recipes_by_name(name)
    conn = Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/recipes/search") do |c|
      c.params[:q] = name
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipes_by_ingredient(ingredient)
    conn = Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/recipes/ingredient") do |c|
      c.params[:q] = ingredient
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end 

  def self.recipes_by_category(category)
    conn = Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/recipes/category") do |c|
      c.params[:q] = category
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end 



end 