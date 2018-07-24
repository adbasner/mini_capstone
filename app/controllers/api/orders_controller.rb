class Api::OrdersController < ApplicationController
  before_action :authenticate_user #, except: [:show]

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render 'show.json.jbuilder'
  end

  def create
    @all_carted_products = CartedProduct.all

    @user_carted_products = []

    # loop through
    @all_carted_products.each do |carted_product|
      if carted_product.status == 'carted' && carted_product.user_id == current_user.id
        @user_carted_products << carted_product
      end
    end

    subtotal = 0
    @user_carted_products.each do |carted_product|
      subtotal += (carted_product.product['price'].to_i * carted_product['quantity'].to_i)
    end

    tax_rate = 0.07
    tax = tax_rate * subtotal
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    @order.save

    @user_carted_products.each do |carted_product|
      cp = CartedProduct.find_by(id: carted_product.id)
      cp.status = 'purchased'
      cp.order_id = @order.id
      cp.save
    end

    render 'show.json.jbuilder'
  end
end
