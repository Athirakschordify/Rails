class AddColumnsToEmployees < ActiveRecord::Migration[7.0]
  def change
        add_column :employees, :age, :string
    add_column :employees, :country, :string
    add_column :employees, :languages_known, :string

    add_column :employees, :image, :string
  end
end
