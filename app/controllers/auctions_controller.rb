class AuctionsController < ApplicationController
  def home
   @auctions = Auction.all
  end
  
  def new
  end
  
end
