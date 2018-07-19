class Api::CartedProductsController < ApplicationController
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
end
