module AuctionsHelper

  def self.checkForExpiredAuction
    # method to update each auction that has expired
    puts Auction

    puts "There are currently #{Auction.count} auctions."

    @auctions = Auction.all

    @auctions.each do |auction|
      if auction.end_time > Time.now.utc
        auction.price = 1000000
        auction.save
        puts "just updated #{auction.product} auction"
      end
    end

    puts "just updated any auctions that had expired"
  end

end
