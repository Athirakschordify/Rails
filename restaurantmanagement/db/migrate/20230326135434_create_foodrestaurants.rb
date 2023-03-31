class CreateFoodrestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :foodrestaurants do |t|
      t.references :restaurantmanagement, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
