class CreateEmps < ActiveRecord::Migration[7.0]
  def change
    create_table :emps do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :age
      t.string :country
     

      t.timestamps
    end
  end
end
