json.array! @user_carted_products.each do |carted_product|
  json.id carted_product.id
  json.user_name carted_product.user.name
  json.product_id carted_product.product_id
  json.quantity carted_product.quantity
  json.status carted_product.status
  json.order_id carted_product.order_id
  json.created_at carted_product.created_at
  json.updated_at carted_product.updated_at
  json.product carted_product.product
end
