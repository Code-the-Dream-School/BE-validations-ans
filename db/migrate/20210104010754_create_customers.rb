class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
