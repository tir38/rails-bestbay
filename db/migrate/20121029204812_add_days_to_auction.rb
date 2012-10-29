class AddDaysToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :days, :integer
  end
end
