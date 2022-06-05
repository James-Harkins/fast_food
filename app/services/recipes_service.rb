class RecipesService 

  def self.conn
    Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
  end 


  def self.recipes_by_name(name)
    # conn = Faraday.new(url: "http://localhost:5000") do |f|
    #   f.adapter Faraday.default_adapter
    # end
    response = conn.get("/api/v1/recipes/search") do |c|
      c.params[:query] = name
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.recipes_by_ingredient(ingredient)
    response = conn.get("/api/v1/recipes/ingredient") do |c|
      c.params[:query] = ingredient
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end 



end 