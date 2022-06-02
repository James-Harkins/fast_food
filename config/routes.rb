Rails.application.routes.draw do




  get '/recipes/search', to: 'recipes/search#index'
  get '/recipes', to: 'recipes#index'
end
