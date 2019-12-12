class CreateWaitQueues < ActiveRecord::Migration[6.0]
  def change
    create_table :wait_queues do |t|
      t.integer :user_id
      t.string :food_choice

      t.timestamps
    end
  end
end
