class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.text :description
      t.references :room_category, foreign_key: true

      t.timestamps
    end
  end
end
