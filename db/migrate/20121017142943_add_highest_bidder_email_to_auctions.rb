class AddHighestBidderEmailToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :highestBidderEmail, :string
  end
end
