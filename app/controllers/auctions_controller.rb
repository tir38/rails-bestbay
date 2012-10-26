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
    flash[:success] = "Auction updated"
		redirect_to root_path
		else
		render 'new'
		end
	end
	
	def placeBids ()

    @auctions = Auction.all
    @auctions.each do |auction|
      if params.keys.include?( "checkbox#{auction.id}")
        # we are assuming that if key is present then checkbox was checked
        # if checkbox was not checked then it will not even be added to params hash
        auction.price = auction.price + 1
        auction.highestBidderEmail = params[:Bidder_email]
        auction.save
        flash[:success] =  "Just updated #{auction.product} with price = #{auction.price}, and set highest bidder email #{auction.highestBidderEmail}"
      end
		end
		redirect_to root_path
	end # end placeBids
end
