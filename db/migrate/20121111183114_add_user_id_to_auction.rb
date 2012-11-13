class AddUserIdToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :user_id, :integer
    add_index  :auctions, [:user_id, :created_at]
  end
end
