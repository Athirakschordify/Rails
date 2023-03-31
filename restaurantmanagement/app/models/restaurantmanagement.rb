class Restaurantmanagement < ApplicationRecord
  validates :restaurant_name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true
  validates :contact_no, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :contact_no, :numericality => true, :uniqueness => true,
                     :length => { :minimum => 10, :maximum => 15 }
  has_many :foodrestaurants
  has_many :foods, through: :foodrestaurants
  has_many :carts
  has_many :users, through: :carts  


end
