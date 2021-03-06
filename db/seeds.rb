# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 100.times do
#   product = Product.new({name: Faker::Coffee.blend_name, price: (rand(1..99) + rand(1..99)/100.round(2)), image_url: Faker::Internet.url, description: Faker::Coffee.notes})
#   product.save
# end

# associate products with supplier
# suppliers = Supplier.all
# products = Product.all
# products.each do |product|
#   product.supplier_id = suppliers.sample.id
#   product.save
# end

# Put image urls from products into the images DB
# products = Product.all
# products.each do |product|
#   image = Image.new(url: product.image_url, product_id: product.id)
#   image.save
#   image = Image.new(url: Faker::Internet.url, product_id: product.id)
#   image.save
# end

# Replace images with random placeholder
samplei = ["http://placebeyonce.com/100-100", "http://placebeyonce.com/101-100", 'http://placebeyonce.com/100-101', 'http://placebeyonce.com/102-100', 'http://placebeyonce.com/99-100', 'http://placebeyonce.com/98-100', 
'http://placebeyonce.com/100-102', 
'http://placebeyonce.com/100-99', 
'http://placebeyonce.com/100-98']
images = Image.all
images.each do |image|
  image.url = samplei.sample
  image.save
end