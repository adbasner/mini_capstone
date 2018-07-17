class Api::OrdersController < ApplicationController
  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render 'show.json.jbuilder'
  end

  def create
    tax_rate = 0.07
    product = Product.find_by(id: params[:input_product_id])
    price = product.price * params[:input_quantity].to_i
    tax = tax_rate * price
    total = price + tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity],
      subtotal: price,
      tax: tax,
      total: total
    )

    @order.save

  
    p @order.subtotal
    render 'show.json.jbuilder'
  end
end
