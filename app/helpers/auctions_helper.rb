module AuctionsHelper

  def self.checkForExpiredAuction
    # method to update each auction that has expired
    @auctions = Auction.all
    @auctions.each do |auction|
      auction.setStatus

      #if auction.end_time < Time.now.utc
       # auction.status = "expired"
        #auction.save
      #end
    end
    puts "just updated any auctions that had expired" # this line is needed for testing
  end
end
