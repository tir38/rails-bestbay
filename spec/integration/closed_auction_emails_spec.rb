require "spec_helper"
require 'user_mailer.rb'

describe 'close auction' do
  describe 'sending emails' do
     before do
       @bidder = FactoryGirl.create(:user2)
       @auction = FactoryGirl.create(:auction)
       # seller is already created as part of @auction
     end

      #context "when auction has not been bid on" do
         it "should send email to seller" do
             pending
         end
      #end



      #context "when auction has been bid on" do
          it "should send email to highest bidder" do

            @auction.highestBidderEmail = @bidder.email
            UserMailer.endAuction_confirmation_to_bidder(@auction).deliver
          end

          it "should send email to seller" do
                 pending
          end
      #end
  end
end