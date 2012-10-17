require "spec_helper"

describe "Home page" do
  #before { }
  it "should render the home page" do
    visit root_path
    page.should_not have_content("404")
  end

  describe "biddding process" do
    it "should not allow submit with empty buyer email" do
      pending
      #expect { click_button submit }.to cause error
    end

    #before do
    #  fill_in "Buyer Email", 	with: "example@example.com"
    #end # before

    it "should increase the price of the auction by $1" do
    pending
      #fill in checkbox
       #expect( click_button submit).to increase(auction.price).by(1)
    end

    it "should update the current highest bidder email" do
      #expect( click_button submit).to
    end

    it "should not submit if no checkboxes are checked" do
    pending
    end
  end # end describe bidding process
end

