class UserMailer < ActionMailer::Base
  default from: "BestBay.tifiv@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end


  def endAuction_confirmation_to_seller(auction)
    @auction = auction

    sellerId = @auction.user_id
    @seller = User.find(sellerId)
    sellerEmail = @seller.email
    sellerName   = @auction.seller_name
    if @auction.highestBidderEmail
      # send email saying auction was won
      mail(:to => "#{sellerName} <#{sellerEmail}>", :subject => "Congratulation! Your auction was sold.")
    else
      # send email saying auction WAS NOT won
      mail(:to => "#{sellerName} <#{sellerEmail}>", :subject => "Your auction has expired with no buyer.")
    end
  end

  def endAuction_confirmation_to_bidder(auction)
    @auction = auction

    if @auction.highestBidderEmail
      highestBidderEmail = @auction.highestBidderEmail
      @highestBidder = User.find_by_email(highestBidderEmail)
      highestBidderName = @highestBidder.name
      mail(:to => "#{highestBidderName} <#{highestBidderEmail}>", :subject => "Congratulation! You have won the auction")
    end
  end

end

