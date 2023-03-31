class AddPriceToFoodrestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :foodrestaurants, :price, :float
  end
end
