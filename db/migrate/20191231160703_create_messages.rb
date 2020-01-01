class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :user_id
      t.string :chatroom_id
    end
  end
end
