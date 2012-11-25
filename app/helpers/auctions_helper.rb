module AuctionsHelper

  def self.checkForExpiredAuction
    # method to update each auction that has expired
    @auctions = Auction.all
    @auctions.each do |auction|
      if auction.end_time < Time.now.utc
        auction.price = 100000
        auction.save
        puts "just updated #{auction.product} auction with price #{auction.price}"
      end
    end
    puts "just updated any auctions that had expired" # this line is needed for testing
  end
end
