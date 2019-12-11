class CreateUserMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_meetups do |t|
      t.integer :user_id
      t.integer :meetup_id

      t.timestamps
    end
  end
end
