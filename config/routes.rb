Rails.application.routes.draw do




  get '/recipes/search', to: 'recipes/search#index'

end
