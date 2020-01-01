class CreateChatroomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chatroom_users do |t|
      t.integer :user_id
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
