class Api::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render 'show.json.jbuilder'
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity]
      # Price stuff in the future
      )
    @order.save
    render 'show.json.jbuilder'
  end
end
