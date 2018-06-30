require 'unirest'

# response = Unirest.get("http://localhost:3000/api/all_products_url")

# puts JSON.pretty_generate(response.body)

response = Unirest.post('http://localhost:3000/api/products',
  parameters: {
    input_name: "Super Coffee",
    input_description: "Better Coffee",
    input_price: 4,
    input_image_url: "sdfs.com"
  })

p response.body
