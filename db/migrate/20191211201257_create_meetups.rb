class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.string :datetime
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
