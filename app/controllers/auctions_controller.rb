class AuctionsController < ApplicationController
  def home
   @auctions = Auction.all
  end
end
