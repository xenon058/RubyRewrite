class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :telno
      t.string :address

      t.timestamps
    end
  end
end
