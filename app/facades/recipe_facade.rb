class RecipeFacade

  def self.find_recipe_by_name(name)
    conn = Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/recipes/search") do |c|
      c.params[:query] = name
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
    recipes = []
    results.each do |result|
    
      recipes << Recipe.new(result)
    end 

    recipes



  end 
end 