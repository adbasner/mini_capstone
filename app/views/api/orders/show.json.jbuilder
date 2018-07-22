json.id @order.id
json.user_id @order.user_id
json.subtotal number_to_currency(@order.subtotal)
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total)
json.products @order.products
json.user @order.user
json.carted_products @order.carted_products

# json.order_email @order.user.email
# json.product_name @order.products.name
# json.product_image @order.products.images[0].url
# json.product_price @order.products.price
