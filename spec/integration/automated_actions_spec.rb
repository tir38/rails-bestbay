# tests for all background processes and automated actions

require "spec_helper"

describe "Background processes:" do

  describe "expired auctions" do

    describe "cronjob for calling ruby method", :long_time => true do

        before(:each) do
          if File.exist?('log/cron_status.log')      # if cron log already exists...
            File.delete('log/cron_status.log')          # clear cron logs
          end
          if File.exist?('log/cron_error.log')
            File.delete('log/cron_error.log')           # ...
          end
          @testAuction = FactoryGirl.create(:auction)  # create an auction
          puts "\twaiting for cron job to execute...." # notify tester of time delay
          sleep 65                                    # wait some time for cron to execute
        end

        it "should output status message to cron_status.log" do
            cronStatusLog = File.read('log/cron_status.log')
            cronStatusLog.should match "just updated any auctions that had expired"
        end

        it "should not output error message to cron_error.log" do
          cronErrorLog = File.read('log/cron_error.log')
        end

        # need destroy method working so that I can do a before(:all) + after(:all), instead of a before(:each)
        #after(:all) do
          #puts @testAuction
          #@testAuction.destroy # need to destroy factory when using before(:all)
        #end
    end

    describe "ruby method for updating expired auctions," do
      describe "expired auction" do
        before do
          # create auction with passed expiration time
          @expiredAuction = FactoryGirl.create(:auction)
          @expiredAuction.end_time = Time.now.utc - 1.minute
          @expiredAuction.save
        end

        it "should update status." do
          AuctionsHelper.checkForExpiredAuction
          # @expiredAuction.status.should eq("expired") # not sure why this doesn't work.
          # Instead I have to re-get the auction from DB
          @expiredAuction = Auction.find(1)
          @expiredAuction.status.should eq("expired")
        end

      end

      describe "non-expired auction" do
        before do
          # create auction with future expiration time
          @nonExpiredAuction = FactoryGirl.create(:auction)
        end

        it "should not update status." do
          initialStatus =  @nonExpiredAuction.status
          AuctionsHelper.checkForExpiredAuction
          @nonExpiredAuction.status.should eq(initialStatus)
        end
      end
    end

  end
end