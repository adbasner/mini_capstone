class Api::ProductsController < ApplicationController
  def index
    user_input = params[:search] || ''
    sort_by = params[:sort_by] || 'id'
    @products = Product.where("LOWER(name) LIKE ?", "%#{user_input.downcase}%").order(sort_by)
    # end
    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      # get input params from runner.rb
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image_url: params[:input_image_url]
    )
    @product.save
    render 'show.json.jbuilder'
  end
 
  def update
    # show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    # create
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.description = params[:input_description] || @product.description
    @product.image_url = params[:input_image_url] || @product.image_url

    # alternative method using rails update method, first one is probably better.
    # @product.update(
    #   name: params[:input_name] || @product.name,
    #   price: params[:input_price] || @product.price,
    #   description: params[:input_description] || @product.description,
    #   image_url: params[:input_image_url] || @product.image_url
    # )
    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    # destroy
    # show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    # now delete it
    @product.destroy
    render json: { message: 'You deleted that coffee.' }
  end
end
