class AuctionsController < ApplicationController

  respond_to :html

	def home
		@auctions = Auction.all
	end
  
	def new
		@auction = Auction.new
  end

  def create
		@auction = Auction.new(params[:auction])
    if @auction.save # if auction validates
      redirect_to root_path
    else
      render 'new'
    end
  end

	def show
    @auction = Auction.find(params[:id])
    respond_with @auction
  end

	def placeBids ()
    @auctions = Auction.all
    @auctions.each do |auction|
      if params.keys.include?( "#{auction.id}")
        # we are assuming that if key is present then checkbox was checked
        # if checkbox was not checked then it will not even be added to params hash
        if params[:Bidder_email].empty?
          flash[:error] =  "Bidder email can't be blank"
        else
          auction.price = auction.price + 1
          auction.highestBidderEmail = params[:Bidder_email]
          auction.save
          flash[:success] =  "Just updated  with price, and set highest bidder email"
        end
      end
    end

    backgroundControllerAction # trigger background controller action when placing bid
    redirect_to root_path
  end # end placeBids


  def backgroundControllerAction
    puts '==================='
    puts 'inside backgroundControllerAction'
    puts '==================='

    @testAuction = Auction.first
    @testAuction.delay.backgroundModelMethod
  end

end
