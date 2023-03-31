class AddQuantityToFoodrestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :foodrestaurants, :quantity, :integer
  end
end
