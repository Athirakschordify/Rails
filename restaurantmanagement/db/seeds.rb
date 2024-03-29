# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'

# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#Restaurantmanagement.create({ restaurant_name: 'Garden Grille Restaurant', address: 'Punnen Road Hilton Garden Inn Trivandrum, Thiruvananthapuram (Trivandrum) 695039 India', email: 'ggr@gmail.com', contact_no: 8765453543 })
#Restaurantmanagement.create({ restaurant_name: 'Zam Zam Restaurant', address: 'VJT University Road Opposite MLA Hostel, Palayam, Thiruvananthapuram (Trivandrum) 695034 India', email: 'zzr@gmail.com', contact_no: 8765678576  })

#food = Foodrestaurant.create({ restaurantmanagement_id: 3, food_id: 1  })
#Cart.create({ user_id: '1', foodrestaurant_id: '1'  })
#binding.pry
1000.times do
	Restaurantmanagement.create!(
		restaurant_name: Faker::Restaurant.name,
	    address:  Faker::Address.full_address,
	    email: Faker::Internet.email,
	    contact_no: Faker::PhoneNumber.cell_phone_in_e164

	)
end 	

