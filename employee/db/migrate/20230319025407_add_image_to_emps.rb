class AddImageToEmps < ActiveRecord::Migration[7.0]
  def change
    add_column :emps, :image, :string
  end
end
