class RenameStartTimeToEndTime < ActiveRecord::Migration
def change
  rename_column :auctions, :start_time, :end_time
end
end
