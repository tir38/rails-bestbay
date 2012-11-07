require "spec_helper"

describe "Home page" do
  before { visit root_path}


  root_URL = "http://0.0.0.0:3000"   # for nokogiri
  let(:submit) {"Place Bids"}

	it "should render the home page." do
		page.should_not have_content("404")
	end

  context "when user is signed in"  do

    let(:user) { FactoryGirl.create(:user)} # create user
    # sign_in :user # and sign in
    # not finding method sign_in

    context "when no checkboxes checked, no email entered, and Place Bids button clicked"  do

      it "should not display any 'success' messages." do
          pending "need to login to see Place Bids button"
          click_button submit
          page.should_not have_content ("Bidder email can't be blank")
          page.should_not have_content ("Just updated with price, and set highest bidder email")
      end

      it "should not make any changes to database." do
        pending "need to login to see Place Bids button"
        expect { click_button submit }.not_to change(Auction, :count)
      end

    end  # context "no checkboxes checked, no email entered, submit button clicked"

    context "when checkbox checked, no email entered, and Place Bids button clicked" do

      before (:each) do
        @testAuction = FactoryGirl.create(:auction) # saved auction, will be rolled back after test, automatically
        visit root_path # revisit page after adding auction
      end

      it "should display error message." do
        pending "need to login to see Place Bids button"
        # since test page, we know that an auction w/ ID = 1 will be on the page
        page.check ('1')
        click_button submit
        page.should have_content ("Bidder email can't be blank")
      end

      it "should not make any changes to database." do
        pending "need to login to see Place Bids button"
        page.check ('1')
        expect {click_button submit}.not_to change(Auction, :count)
      end
    end
  end # context "when user is signed in"

  # --------------------------------------------------------------------
  context "when user is not signed in" do

    it "should not display 'Place Bids' button." do
      page.should_not have_content(submit)
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

end

