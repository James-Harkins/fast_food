class RecipesController < ApplicationController

  def index
    if params[:area].blank? && params[:category].blank? && params[:name].blank? && params[:ingredient].blank?
      flash[:error] = "Please Enter a Search Parameter"
      redirect_to "/recipes/search"
      
    elsif params[:name]
      @query = params[:name]
      conn = Faraday.new(url: "http://localhost:5000") do |f|
        f.adapter Faraday.default_adapter
      end
      response = conn.get("/api/v1/recipes/search") do |c|
        c.params[:query] = @query
      end
      @recipes
      results = JSON.parse(response.body, symbolize_names: true)[:data]
      @recipes = []
      results.each do |result|
     
        @recipes << Recipe.new(result)
      end 
    

    end 


  
  end
  
  
end 