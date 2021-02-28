Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # insomnia         controller action
    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
  end
end
