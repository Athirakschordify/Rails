class AddProductIdToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :product_id, :integer
  end
end
