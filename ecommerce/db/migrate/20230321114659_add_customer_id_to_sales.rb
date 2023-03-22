class AddCustomerIdToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :customer_id, :integer
  end
end
