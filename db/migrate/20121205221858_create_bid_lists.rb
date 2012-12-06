class CreateBidLists < ActiveRecord::Migration
  def change
    create_table :bid_lists do |t|
      t.integer :user_id
      t.integer :auction_id

      t.timestamps
    end
  end
end
