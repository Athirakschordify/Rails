class RestaurantmanagementSerializer < ActiveModel::Serializer
  attributes :restaurant_name, :address, :email, :contact_no
end
