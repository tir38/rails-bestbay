class AuctionsController < ApplicationController
  def home
   @auctions = Auction.all
  end
  
  def new
	@auction = Auction.new
  end
  
  def create
	@auction = Auction.new(params[:auction])
    if @auction.save
      redirect_to root_path
    else
      render 'new'
    end
  end


end
