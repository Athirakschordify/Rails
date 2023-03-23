class CreateRestaurantmanagements < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurantmanagements do |t|
      t.string :restaurant_name
      t.string :address
      t.string :email
      t.bigint :contact_no
      t.timestamps
    end
  end
end
