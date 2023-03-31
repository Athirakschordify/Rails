class Food < ApplicationRecord
  validates :food_name, presence: true
  has_many :foodrestaurants
  has_many :restaurantmanagements, through: :foodrestaurants 
end
