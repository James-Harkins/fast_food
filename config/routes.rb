Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get "/dashboard", to: "users#show"
  get "/auth/google_oauth2/callback", to: "users#new"

  post "/login", to: "sessions#create"

  get "/recipes", to: "recipes#index"

  get "/recipes/search", to: "recipes/search#index"
end
