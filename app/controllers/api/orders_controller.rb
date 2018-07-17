class Api::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render 'show.json.jbuilder'
  end

  def create
    @order = Order.new(
      user_id: 8, #current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity]
      # Price stuff in the future
      )
    @order.save
    render 'show.json.jbuilder'

    # @product = Product.new(
    #   # get input params from runner.rb
    #   name: params[:input_name],
    #   price: params[:input_price],
    #   description: params[:input_description],
    #   # image_url: params[:input_image_url]
    # )
    # @product.save
    # render 'show.json.jbuilder'
  end
end
  