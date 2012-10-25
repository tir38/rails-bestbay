require "spec_helper"

describe "Home page =>" do

  before(:each) do
    # must put factory creation inside before(:each) or FG won't know to get rid of it at the end of the
    # test. i.e. the next time you run this test you'll have two instances in DB, instead of one.
    @testAuction = FactoryGirl.create(:auction) # saved auction
		visit root_path
  end
  
	it "should render the home page." do
		page.should_not have_content("404")
	end

	describe "when bidding =>" do
		let(:bid) {"Place Bids"}
  
		it "should not allow submit with empty buyer email." do
		  pending
		  #expect { click_button submit }.to cause error
		end


		describe "when bidding on single auction =>"  do
			@auctions = Auction.all

      puts "\n\n----- REMINDER Auction test database has #{Auction.all.size} entries. ----- \n"
			@auctions.each do |auction|

				it "should increase the price of a checked auction '#{auction.product}' by $1." do

          check (auction.id.to_s)
          puts "according to spec, auction price before click is #{auction.price}"  # => 10
          expect {click_button bid}.to change {auction.price}.from(auction.price).to(auction.price + 1)
				end

        puts "according to spec, auction price after click and revisit is #{auction.price}"  # 10

				it "should update the current highest bidder email." do
					pending
					check (auction.id.to_s)
					newBidderEmail = "kevin@yahoo.com" # enter new bidder email
					auction.respond_to?(:highestBidderEmail)
					expect {click_button bid}.to change {auction.highestBidderEmail}.from("jason").to(newBidderEmail)
				end
			end
		end

		it "should not submit if no checkboxes are checked." do
			pending
		end
    
	end
  
end

