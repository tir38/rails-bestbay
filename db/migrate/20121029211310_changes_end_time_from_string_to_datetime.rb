class ChangesEndTimeFromStringToDatetime < ActiveRecord::Migration
  def up
    remove_column :auctions, :end_time
    add_column :auctions, :end_time, :datetime
  end

  def down
    remove_column :auctions, :end_time, :datetime
    add_column :auctions, :end_time, :string
  end
end
