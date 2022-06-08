class CocktailsFacade
  def self.find_by_area(area)
    cocktail_data = CocktailsService.find_by_area(area)
    binding.pry
    Cocktail.new(cocktail_data)
  end
end
