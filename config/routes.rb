Rails.application.routes.draw do
  # root route
  root to: "sessions#new"
  get "main", to: "main#index"


  get "login" , to:"sessions#new" 
  post "login", to:"sessions#create"

  delete "logout", to: "sessions#destroy"


  get "/adduser" , to:"adduser#new"
  post "/adduser", to:"adduser#create"


  get "/shodan", to: "shodan#index"
  get "/search", to: "search#search"
end
