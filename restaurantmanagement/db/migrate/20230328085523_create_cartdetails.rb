class CreateCartdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cartdetails do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :foodrestaurant, null: false, foreign_key: true

      #t.quantity :integer
      t.index [:cart_id, :foodrestaurant_id], unique: true



      t.timestamps
    end
  end
end
