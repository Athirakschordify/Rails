class Cartdetail < ApplicationRecord
  belongs_to :cart
  belongs_to :foodrestaurant
end
