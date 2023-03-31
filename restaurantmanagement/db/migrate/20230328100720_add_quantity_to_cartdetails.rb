class AddQuantityToCartdetails < ActiveRecord::Migration[7.0]
  def change
    add_column :cartdetails, :quantity, :integer
  end
end
