Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # Products DB
    # --------------------------------
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    # Users/Login
    # ---------------------------------
    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    # Orders
    # ---------------------------------
    get '/orders/:id' => 'orders#show'
    post '/orders/' => 'orders#create'

    # Cart
    # ----------------------------------
    get '/carted_products/' => 'carted_products#index'
    get '/carted_products/:id' => 'carted_products#show'
    post '/carted_products/' => 'carted_products#create'
    patch 'carted_products/:id' => 'carted_products#update'
  end
end
