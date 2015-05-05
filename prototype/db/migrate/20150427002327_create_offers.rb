class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
    	t.integer :price
    	t.integer :user_id
    	t.integer :status, default: 1
    	t.integer :listing_id
      t.timestamps null: false
    end
  end
end
