Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get "/dashboard", to: "users#show"
  get "/auth/google_oauth2/callback", to: "users#new"

  get "/recipes", to: "recipes#index"
  get "/recipes/search", to: "recipes/search#index"
  get "/recipes/:id", to: "recipes#show"
  get "/recipes/random", to: "recipes#show"

  post "/saved_recipes", to: "saved_recipes#create"

  get "/logout", to: "sessions#destroy"

  get "/admin/dashboard", to: "admin#index"
  get "/admin/new", to: "admin#new"
  post "/admin", to: "admin#create"

  get "/admin/security_check", to: "admin/security#new"

  get "/admin/login", to: "admin/sessions#new"
  post "/admin/login", to: "admin/sessions#create"
  delete "/admin/logout", to: "admin/sessions#destroy"

  delete "/admin/users", to: "admin/users#destroy"

  get "/about_the_team", to: "team#index"
end
