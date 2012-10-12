class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :start_time
  
	validates  :price, :product, :start_time, :presence => true

end
