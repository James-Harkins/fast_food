class CocktailsService
  def self.conn
    Faraday.new(url: ENV["BASE_URL"]) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.find_by_area(area)
    response = conn.get("/api/v1/cocktail") do |c|
      c.params[:area] = area
    end
    results = JSON.parse(response.body, symbolize_names: true)[:data]
  end
end
