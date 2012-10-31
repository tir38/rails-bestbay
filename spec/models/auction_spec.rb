# == Schema Information
#
# Table name: auctions
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :decimal(, )
#  product            :string(255)
#  seller_name        :string(255)
#  baseinfo           :string(255)
#  start_time         :string(255)
#  highestBidderEmail :string(255)
#  bid                :boolean
#

require 'spec_helper'
describe Auction do  # tests for the model

  before(:each) do  # new factory for each of the following tests
	  @testAuction = FactoryGirl.build(:auction) # non saved auction
  end

	it 'is not valid without a price.' do
		@testAuction.price = nil
    @testAuction.should_not be_valid
	end
	
	it 'is not valid without a product.' do
		@testAuction.product = nil
		@testAuction.should_not be_valid
	end
	
	it 'is not valid without a days.' do
		@testAuction.days = nil
		@testAuction.should_not be_valid
  end

  it 'is not valid without a hours.' do
    @testAuction.hours = nil
    @testAuction.should_not be_valid
  end

end
