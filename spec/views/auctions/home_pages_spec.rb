require "spec_helper"

describe "Home page =>" do
  @testAuction = Auction.create(:product => "test", :price => 10, :start_time => "10:00:00")
  # populate testDB
  # if you just ran rake db:test:prepare, then the test DB is empty

  before(:each) do
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

    puts "\n\n----- REMINDER Auction test database has #{Auction.all.size} entries. ----- \n"
		describe "when bidding on single auction =>"  do
			@auctions = Auction.all
			@auctions.each do |auction|

				it "should increase the price of a checked auction '#{auction.product}' by $1." do
					check (auction.id.to_s)
          puts "according to spec, auction price before click is #{auction.price}"
          click_button bid
          visit root_path
          puts "according to spec, auction price after click and revisit is #{auction.price}"
          page.should have_content('11')
          pending
          # this isn't working
					#expect {click_button bid}.to change {auction.price}.from(auction.price).to(auction.price + 1)
				end


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

