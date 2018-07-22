json.id product.id
json.name product.name
json.description product.description
json.price number_to_currency(product.price)
json.supplier product.supplier
json.images product.images
json.categories product.categories
json.created_at product.created_at
json.updated_at product.created_at


json.formatted do
  json.discounted product.is_discounted?
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end