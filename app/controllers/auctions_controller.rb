class AuctionsController < ApplicationController
  def index
   @auctions = Auction.all
  end
  
  def new
	@auction = Auction.new
  end
  
  def create
	@auction = Auction.new(params[:auction])
    if @auction.save
      redirect_to '/auctions'
    else
      render 'new'
    end
  
  end
  
end
