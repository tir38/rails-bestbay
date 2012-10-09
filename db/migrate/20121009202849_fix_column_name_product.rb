class FixColumnNameProduct < ActiveRecord::Migration
  def change
    rename_column :auctions, :Product, :product
  end
end
