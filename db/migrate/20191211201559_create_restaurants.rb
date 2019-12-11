class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :yelp_id

      t.timestamps
    end
  end
end
