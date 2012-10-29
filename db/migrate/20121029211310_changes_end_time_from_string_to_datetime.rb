class ChangesEndTimeFromStringToDatetime < ActiveRecord::Migration
  def up
    change_table :auctions do |t|
      t.change :end_time, :datetime
    end
  end

  def down
    change_table :auctions do |t|
      t.change :end_time, :string
    end
  end
end
