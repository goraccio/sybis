User.delete_all
Sale.delete_all
Product.delete_all

User.create! email: 'admin@example.com', password: '12345678'

100.times do |n|
  Product.create! name: "#{Faker::Commerce.product_name} #{n}"
end

products = Product.all

1000.times do
  Sale.create! product: products.sample,
               cost: Faker::Commerce.price,
               date_of_purchase: Faker::Date.between(30.days.ago, Date.today)
end