Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # index = show all of something
    get '/products' => 'products#index'
    # show = get 1 of something
    get '/products/:id' => 'products#show'
    # post = adding stuff, as in a form, new item, passwords...
    post '/products' => 'products#create'
    # update = changes db info
    patch '/products/:id' => 'products#update'
    # destroy/delete = removes from db
    delete '/products/:id' => 'products#destroy'
  end
end
 