class Auction < ActiveRecord::Base


	attr_accessible :id, :price, :Product, :baseinfo, :seller_name, :start_time
  
	validates :id, :price, :Product, :start_time, :presence => true
  



end
