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
      time = @auction.days*24 + @auction.hours
      @auction.end_time = time.hours.from_now.utc
      @auction.save
      flash[:success] = "Auction updated"
      redirect_to root_path
		else
		  render 'new'
		end
	end
	
	def placeBids ()
         puts 'inside placeBids'
    @auctions = Auction.all
    @auctions.each do |auction|
      if params.keys.include?( "#{auction.id}")
        # we are assuming that if key is present then checkbox was checked
        # if checkbox was not checked then it will not even be added to params hash
        puts params.keys
        if params.keys.include?("Bidder_email")
          auction.price = auction.price + 1
          auction.highestBidderEmail = params[:Bidder_email]
          auction.save
          flash[:success] =  "Just updated  with price, and set highest bidder email"
        else
          flash[:alert] =  "Bidder email can't be blank"
        end
      end
    end
    redirect_to root_path
  end # end placeBids

end
