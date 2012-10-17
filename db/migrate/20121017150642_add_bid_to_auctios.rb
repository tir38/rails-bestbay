class AddBidToAuctios < ActiveRecord::Migration
  def change
    add_column :auctios, :bid, :boolean
  end
end
