class Api::ProductsController < ApplicationController

  def display_all_product_info
    @products = Product.all
    render "all_products_view.json.jbuilder"
  end
end
