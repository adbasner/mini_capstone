json.id @product.id
json.name @product.name
json.description @product.description
json.price @product.price
json.image_url @product.image_url
json.created_at @product.created_at
json.updated_at @product.created_at

json.formatted do
  json.discounted @product.is_discounted?
  json.tax @product.tax
  json.total @product.total
end
