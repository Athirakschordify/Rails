class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurantmanagement, null: false, foreign_key: true
      t.index [:user_id, :restaurantmanagement_id], unique: true
      #t.integer :quantity

      



      t.timestamps
    end
  end
end
