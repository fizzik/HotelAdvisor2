class CreateRating < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :hotel_id
    end
  end

end
