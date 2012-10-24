class AddBidToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :bid, :boolean
  end
end
