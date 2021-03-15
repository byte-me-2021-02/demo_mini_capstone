Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE

  # 3 tiers of users
  # guests
  # users
  # admin

  

  
  
  namespace :api do
    # insomnia         controller action
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    # only for users/admins
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"
    post "/orders" => "orders#create"
    
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    post "/carted_products" => "carted_products#create"
  end
end
