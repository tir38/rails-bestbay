class AuctionsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy, :addToWatchList, :placeBid, :deleteWatchlist]
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
     @item = WatchList.all(:conditions => { :auction_id => params[:id] })
     if @item
       @item.each do |i|
         i.destroy
       end
     end
     if @auction
       @auction.destroy
     end
     flash[:success] = "Auction deleted from your posted auctions."
     redirect_to current_user
  end

	def show
    @auction = Auction.find(params[:id])
    #respond_with @auction
  end

	def addToWatchList
     @auctions = Auction.all
     count1 = current_user.watch_lists.count
     @auctions.each do |auction|
       if params.keys.include?("#{auction.id}")
         if auction.user_id != current_user.id
         flag = 0
         current_user.watch_lists.each do |item|
           if item.auction_id == auction.id
                flag = 1
                break
           end
         end
         if flag == 0
           @watch_list = current_user.watch_lists.build(params[:watch_list])
           @watch_list.auction_id = auction.id
           @watch_list.save
         end
        end
      end
     end
     count2 = current_user.watch_lists.count
     if count2 > count1
       flash[:success] = "Auctions have been successfully added to your watch list!"
       redirect_to current_user
     else
       flash[:notice] = "Please choose at least one auction that is not yours and not in your watch list."
       redirect_to root_url
     end

   # @auctions = Auction.all
   # @auctions.each do |auction|
   #   if params.keys.include?( "#{auction.id}")
        # we are assuming that if key is present then checkbox was checked
        # if checkbox was not checked then it will not even be added to params hash
   #       auction.price = auction.price + 1
   #       auction.highestBidderEmail = current_user.email
   #       auction.save
   #       flash[:success] =  "Just updated  with price, and set highest bidder email"
   #   end
   #  end
    #redirect_to root_path
  end # end addToWatchList

  def deleteWatchlist
    @item = current_user.watch_lists.find(params[:item_id])
    if @item
      @item.destroy
    end
    flash[:success] = "Auction removed from your interested auctions."
    redirect_to current_user
  end

  def placeBid
     if !params[:amount].blank?
       amount = Integer(params[:amount])
       currentPrice = params[:currentPrice].to_f
       @auction = Auction.find(params[:auction_id])
       if (currentPrice + amount) > @auction.price
         @auction.price = currentPrice + amount
         @auction.highestBidderEmail = current_user.email
         @auction.save
         flash[:success] = "Successful placed bid!"
       elsif (currentPrice + amount) == @auction.price
         flash[:notice] = "Somebody has placed a same bid before you.
                         If you want to be the highest bidder, please rebid on this item."
       else
         flash[:notice] = "Somebody has placed a higher bid than you.
                         If you want to be the highest bidder, please rebid on this item."
       end
     else
       flash[:error] = "Bid price must be a non-zero integer."
     end
     redirect_to "/auctions/#{params[:auction_id]}"
  end


  private

  def correct_user
    @auction = current_user.auctions.find_by_id(params[:id])
    redirect_to root_url if @auction.nil?
  end
end
