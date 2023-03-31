class Cart < ApplicationRecord
  
  #validates :foodrestaurant_id, presence: true
  belongs_to :user
  belongs_to :restaurantmanagement
  has_many :cartdetails, :dependent => :destroy
  #has_many :foodrestaurants, through: :cartdetails
  validates :user_id, uniqueness: { scope: :restaurantmanagement_id, message: "Restaurant already exists for this user." }
  #has_many :foods
end
