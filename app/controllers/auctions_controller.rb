class AuctionsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user,   only: :destroy
	def home
		@auctions = Auction.all
	end

	def new
		@auction = Auction.new
  end

  def create
		@auction = current_user.auctions.build(params[:auction])
    @auction.seller_name = current_user.name
    if @auction.save # if auction validates
      flash[:success] = "Auction created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
     @auction = current_user.auctions.find(params[:id])
     @auction.destroy
     redirect_to current_user
  end

	def show
    @auction = Auction.find(params[:id])
    #respond_with @auction
  end

	def placeBids ()
    @auctions = Auction.all
    @auctions.each do |auction|
      if params.keys.include?( "#{auction.id}")
        # we are assuming that if key is present then checkbox was checked
        # if checkbox was not checked then it will not even be added to params hash
          auction.price = auction.price + 1
          auction.highestBidderEmail = current_user.email
          auction.save
          flash[:success] =  "Just updated  with price, and set highest bidder email"
      end
    end
    redirect_to root_path
  end # end placeBids

  private

  def correct_user
    @auction = current_user.auctions.find_by_id(params[:id])
    redirect_to root_url if @auction.nil?
  end
end
