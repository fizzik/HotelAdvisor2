class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.integer :user_id
      t.string :title
      t.string :breackfast
      t.string :room_description
      t.integer :price

      t.timestamps
    end
  end
end
