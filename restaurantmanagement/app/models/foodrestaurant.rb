class Foodrestaurant < ApplicationRecord
  validates :restaurantmanagement_id, presence: true
  validates :food_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  belongs_to :restaurantmanagement
  belongs_to :food
  has_many :cartdetails
  has_many :carts, through: :cartdetails 
  has_many :orders
  
end
