class AddHoursToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :hours, :integer
  end
end
