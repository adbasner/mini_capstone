json.id @order.id
json.user_id @order.user_id
json.product_id @order.product_id
json.quantity @order.quantity
json.subtotal number_to_currency(@order.subtotal)
json.tax number_to_currency(@order.tax)
json.total number_to_currency(@order.total)
json.created_at @order.created_at.strftime("%D at %r")
json.order_email @order.user.email
json.product_name @order.product.name
json.product_image @order.product.images[0].url
json.product_price @order.product.price



