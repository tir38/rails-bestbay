class ChangesPriceDataTypeFromFloatToDecimal< ActiveRecord::Migration
   def up
    change_table :auctions do |t|
      t.change :price, :decimal
    end
  end

  def down
    change_table :auctions do |t|
      t.change :price, :float
    end
  end
end
