class AddsPriceToAuction < ActiveRecord::Migration

  def change
	add_column :auctions, :price, :decimal #, :precision => 8, :scale => 2
	add_column :auctions, :id, :integer
	add_column :auctions, :Product, :string
        add_column :auctions, :seller_name, :string
        add_column :auctions, :baseinfo, :string
        add_column :auctions, :start_time, :string
  end
end
