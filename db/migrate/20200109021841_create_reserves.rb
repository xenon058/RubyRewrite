class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.integer :no
      t.datetime :date
      t.integer :room_no
      t.integer :customer_id
      t.integer :numbers
      t.string :checkin_time
      t.text :message

      t.timestamps
    end
  end
end
