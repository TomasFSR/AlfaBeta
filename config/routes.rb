Rails.application.routes.draw do
  root to: "index#main"
  
  get "/about", to: "about#main" 
  
  get "/register", to: "register#new"
  post "/register", to: "register#create"
  
  get "/login", to: "session#new#"
  post "/login", to: "session#create"
  
  delete "/logout", to: "session#destroy"

  get "/password", to: "passwords#edit"
  patch "/password", to: "passwords#update"
  
  get "/password/reset", to: "passwords_resets#new"
  post "/password/reset", to: "passwords_resets#create"
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

