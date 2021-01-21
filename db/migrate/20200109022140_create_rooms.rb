class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :no
      t.string :name
      t.text :information
      t.string :main_image
      t.string :image1
      t.string :image2
      t.string :image3
      t.text :amenity
      t.integer :dayfee
      t.integer :capacity
      t.integer :type_id

      t.timestamps
    end
  end
end
