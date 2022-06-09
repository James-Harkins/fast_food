Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get "/dashboard", to: "users#show"
  get "/auth/google_oauth2/callback", to: "users#new"

  get "/recipes", to: "recipes#index"
  get "/recipes/search", to: "recipes/search#index"
  get "/recipes/:id", to: "recipes#show"
  get "/recipes/random", to: "recipes#show"

  post "/saved_recipes", to: "saved_recipes#create"

  delete "/sessions", to: "sessions#destroy"

  get "/admin/security_check", to: "admin/security#new"
end
