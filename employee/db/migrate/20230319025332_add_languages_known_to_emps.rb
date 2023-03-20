class AddLanguagesKnownToEmps < ActiveRecord::Migration[7.0]
  def change
    add_column :emps, :languages_known, :string
  end
end
