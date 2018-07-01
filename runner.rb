require 'unirest'
require 'faker'

# response = Unirest.get("http://localhost:3000/api/all_products_url")

# puts JSON.pretty_generate(response.body)

# create

p '-' * 50
p 'Do you want to enter a new coffee? Type yes if you do.'
create = gets.chomp.downcase

if create == 'yes'
  p '-' * 50
  p 'Do you want to autogenerate a coffee? Type yes if you do.'
  auto = gets.chomp.downcase
  if auto == 'yes'
    response = Unirest.post('http://localhost:3000/api/products',
    parameters: {
      input_name: Faker::Coffee.blend_name,
      input_description: Faker::Coffee.notes,
      input_price: rand(1..99),
      input_image_url: Faker::Internet.url
    })
    p '-' * 50
  else
    p '-' * 50
    p 'Enter a coffee name:'
    name = gets.chomp
    p '-' * 50

    p 'Enter a coffee description:'
    description = gets.chomp
    p '-' * 50

    p 'Enter a price (integer):'
    price = gets.chomp.to_i
    p '-' * 50

    p 'Enter an image url:'
    image_url = gets.chomp
    p '-' * 50

    response = Unirest.post('http://localhost:3000/api/products',
    parameters: {
      input_name: name,
      input_description: description,
      input_price: price,
      input_image_url: image_url
    })
  end
  p 'New product created.'
  p response.body
end
p '-' * 50

# update
p 'Do you want to update a coffee? Type yes if you do.'
update = gets.chomp.downcase

if update == 'yes'
  p '-' * 50
  p 'What coffee id do you want to change?'
  product_id = gets.chomp
  p '-' * 50

  p 'Enter a new name:'
  update_name = gets.chomp
  p '-' * 50

  p 'Enter a new description'
  update_description = gets.chomp
  p '-' * 50

  p 'Enter a new price'
  update_price = gets.chomp.to_i
  p '-' * 50

  response = Unirest.patch("localhost:3000/api/products/#{product_id}",
    parameters: {
      input_name: update_name,
      input_description: update_description,
      input_price: update_price
    })
  p 'Product has been updated'
  p response.body
end
p '-' * 50

# destroy

p 'Do you want to delete a coffee? Type yes if you do.'
delete = gets.chomp.downcase

if delete == 'yes'
  p '-' * 50
  p 'What coffee id do you want to delete?'
  product_id = gets.chomp
  p '-' * 50

  response = Unirest.delete("localhost:3000/api/products/#{product_id}")

  p "You deleted coffee ##{product_id}."
  p '-' * 50
  p 'Server reponse:'
  p response.body
  p '-' * 50
end
