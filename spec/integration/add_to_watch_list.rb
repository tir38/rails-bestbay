require "spec_helper"

describe "When adding to watchlist" do
  let(:button) {"Add to watch list"} # place bid button name

  describe "when adding a single auction"  do
    before(:each) do
      @testAuction  = FactoryGirl.create(:auction) # saved auction
      @user         = FactoryGirl.create(:user1)
      visit root_path
      sign_in @user # and sign in
      visit root_path # revsist after redirect on signin

    end

    it "page should have Add to watch list button" do
      page.should have_button("Add to watch list")
    end

    it "should increase the user's watchlist by 1 auction" do
      check (@testAuction.id.to_s)
      expect {click_button button}.to change {@user.watch_lists.count}.by(1)
    end
  end
end
