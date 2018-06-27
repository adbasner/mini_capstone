require 'unirest'

response = Unirest.get("http://localhost:3000/api/all_products_url")

puts JSON.pretty_generate(response.body)
