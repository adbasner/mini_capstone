json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.description product.description
  json.price product.price
  json.image_url product.image_url
end
