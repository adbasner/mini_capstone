# json.id @user_carted_product.id
# json.user_id @user_carted_product.user_id
# json.product_id @user_carted_product.product_id
# json.quantity @user_carted_product.quantity
# json.status @user_carted_product.status
# json.order_id @user_carted_product.order_id
# json.created_at @user_carted_product.created_at
# json.created_at @user_carted_product.updated_at
# json.product @user_carted_product.product
# json.products do
#   json.partial! @user_carted_product.product, partial: 'product', as: :product
# end

json.array! @user_carted_products.each do |carted_product|
  json.id carted_product.id
  json.user_id carted_product.user_id
  json.product_id carted_product.product_id
  json.quantity carted_product.quantity
  json.status carted_product.status
  json.order_id carted_product.order_id
  json.created_at carted_product.created_at
  json.created_at carted_product.updated_at
  json.product carted_product.product
end
