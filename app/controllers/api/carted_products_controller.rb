class Api::CartedProductsController < ApplicationController
  def index
    # Get all carted products
    @all_carted_products = CartedProduct.all

    @user_carted_products = []
    
    # loop through
    @all_carted_products.each do |carted_product|
      if carted_product.status == 'carted' && carted_product.user_id == current_user.id
        @user_carted_products << carted_product
      end
    end
    render 'index.json.jbuilder'
  end

  def show
    carted_products_id = params[:id]
    @carted_product = CartedProduct.find_by(id: carted_products_id)
    render 'show.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
      status: 'carted',
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @carted_product.save

    render 'show.json.jbuilder'
  end

  def update
    # change status to purchased
    # add correct order id
  end
end
