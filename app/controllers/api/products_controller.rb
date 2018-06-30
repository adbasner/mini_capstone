class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image_url: params[:input_image_url]
    )
    @product.save
    render 'show.json.jbuilder'
  end

  def update
    #show
    #create
    render 'show.json.jbuilder'
  end

  def destroy
    #destroy
  end
end

# namespace :api do
#   get '/products' => 'products#index'
#   get '/products/id' => 'products#show'
# end

# Product.new({name: Faker::Coffee.blend_name, price: (rand(1..99) + rand(1..99)/100.round(2)), image_url: Faker::Internet.url, description: Faker::Coffee.notes})