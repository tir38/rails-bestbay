require "spec_helper"


describe "When browsing the site" do
  describe "home page" do

    before (:each) do
      @testAuction = FactoryGirl.create(:auction)
      visit root_path
    end

    describe "response of clicking link(s)" do
      it "should redirect to individual auction's page"     do
        pending ("need to learn how to make 'redirect_to' work with integration testing")
        expect(click_link ("#{@testAuction.product}")).to  redirect_to("/auctions/#{@testAuction.id}")
      end
    end
  end
end