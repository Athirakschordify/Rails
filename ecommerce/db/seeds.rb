# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


p1 = Product.create({ product_name: 'book', quantity: 200,price: 100})
p2 = Product.create({ product_name: 'pen', quantity: 100,price: 30})
p3 = Product.create({ product_name: 'ball', quantity: 50,price: 40})
c1 = Customer.create({ name: 'Sally', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa' })
c2 = Customer.create({ name: 'Sue', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa' })
c3 = Customer.create({ name: 'Kev', email: 'kev@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa' })
c4 = Customer.create({ name: 'Jack', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa'})



