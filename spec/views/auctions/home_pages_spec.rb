require "spec_helper"

describe "Home page" do
  before { visit root_path}

  let(:submit) {"Add to watch list"}

	it "should render the home page." do
		page.should_not have_content("404")
	end

  context "when user is signed in"  do
    let(:user) { FactoryGirl.create(:user) }  # 2.
    before do
      sign_in user # and sign in
      visit root_path
    end

    it "should have Add to watch list button" do
      page.should have_button(:submit)#"Add to watch list")
    end

    context "when no checkboxes checked, and 'Add to watch list' button clicked"  do

      it "should not display any 'success' messages." do
          click_button submit
          page.should have_content("Please choose at least one auction that is not yours and not in your watch list.")
          page.should_not have_content ("Auctions have been successfully added to your watch list!")
      end

      it "should not make any changes to database." do
        expect { click_button submit }.not_to change(Auction, :count)
      end

    end

    context "when checkbox checked, and 'Add to watch list' button clicked" do

      # this test now in "adding to watchlist" integration test

    end
  end

  # --------------------------------------------------------------------
  context "when user is not signed in" do

    it "should not display 'Add to watch list' button." do
      page.should_not have_content(:submit)
    end

    describe "when check box checked" do
      before (:each) do
        @testAuction = FactoryGirl.create(:auction) # saved auction, will be rolled back after test, automatically
        visit root_path # revisit page after adding auction
      end

      it "should not make any changes to database." do
        expect {page.check '1'}.not_to change(Auction, :count)
      end
    end
  end

  # --------------------------------------------------------------------
  describe "links on the page" do

    before (:each) do
      @testAuction = FactoryGirl.create(:auction)
      visit root_path
    end
    describe "presence of link(s)" do
      it "link to individual auction should exist" do
        page.should have_link("#{@testAuction.product}", {:href => "/auctions/#{@testAuction.id}"} )
      end
    end
  end
end

