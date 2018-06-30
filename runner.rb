require 'unirest'
require 'faker'

# response = Unirest.get("http://localhost:3000/api/all_products_url")

# puts JSON.pretty_generate(response.body)

# create
p '*' * 80

p 'Do you want to create a product, yes or no?'
answer = gets.chomp.downcase
if answer == 'yes'
  response = Unirest.post('http://localhost:3000/api/products',
    parameters: {
      input_name: Faker::Coffee.blend_name,
      input_description: Faker::Coffee.notes,
      input_price: rand(1..99),
      input_image_url: Faker::Internet.url
    })

  p response.body
end

# update
p '*' * 80

p 'Do you want to update a product, yes or no?'
answer2 = gets.chomp.downcase
if answer2 == 'yes'
  p 'What coffee id do you want to change?'
  product_id = gets.chomp
  p 'Enter a new name then new price.'
  response = Unirest.patch("localhost:3000/api/products/#{product_id}",
    parameters: {
      input_name: gets.chomp,
      input_price: gets.chomp.to_i
    })

  p response.body
end

# destroy
p '*' * 80

p 'Do you want to delete a product, yes or no?'
answer3 = gets.chomp.downcase
if answer3 == 'yes'
  p 'What coffee id do you want to delete?'
  product_id = gets.chomp

  response = Unirest.delete("localhost:3000/api/products/#{product_id}")

  p "You deleted coffee ##{product_id}."
  p response.body
end

p '*' * 80
