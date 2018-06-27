class Api::ProductsController < ApplicationController

  def display_all_product_info
    @message = "hello"
    render "all_products_view.json.jbuilder"
  end
end
