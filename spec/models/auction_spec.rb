require 'spec_helper'
describe Auction do  # tests for the model
	# model attributes :id, :price, :Product, :baseinfo, :seller_name, :start_time
	
	testAuction = Auction.new()

	#testAuction = FactoryGirl.create(:emptyAuction)

	it 'is not valid without a price' do
		# not the best way of doing this
		testAuction.should_not be_valid
	end
	
	it 'is not valid without a product' do
		testAuction.price = 12.00
		testAuction.should_not be_valid
	end
	
	it 'is not valide without a start time' do
		testAuction.product = 'dummy product name'
		testAuction.should_not be_valid
	end
end
