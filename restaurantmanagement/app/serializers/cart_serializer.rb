class CartSerializer < ActiveModel::Serializer
  attributes :user_id,  :restaurant_name, :cartdetails
  def restaurant_name
    object&.restaurantmanagement&.restaurant_name
  end

  
 

end
