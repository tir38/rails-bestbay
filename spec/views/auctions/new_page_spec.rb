require "spec_helper"

describe "New Post page" do
  before { visit new_path}
    it "should render the New Post page." do
      page.should_not have_content("404")
      page.should_not have_content("Routing Error")
      page.should_not have_content("Template")
    end

  let(:submit) {"Submit auction"}

  describe "with no form data" do
    it "should not create new post." do
      expect {click_button submit}.not_to change(Auction, :count)
    end
  end

  describe "with wrong values" do
    it "should not create new post with duration less than one hour."  do
      fill_in "Seller name", 	with: "example seller"
      fill_in "Baseinfo", 	with: "example description" # do we need this, not mandatory?
      fill_in "Price", 		with: 10
      fill_in "Days", 	with: 0
      fill_in "Hours", with: 0
      fill_in "Product", with: "example product"
      expect { click_button submit }.to_not change(Auction, :count).by(1)
      #page.should have_content ("Cannot create auction with zero duration")
    end
  end

  describe "with valid form data" do
    before do
      fill_in "Seller name", 	with: "example seller"
      fill_in "Baseinfo", 	with: "example description" # do we need this, not mandatory?
      fill_in "Price", 		with: 10
      fill_in "Days", 	with: 5
      fill_in "Hours", with: 0
      fill_in "Product", with: "example product"
    end # before

    it "should create new post." do
      expect { click_button submit }.to change(Auction, :count).by(1)
    end
  end
  
end #describe "New Post page"
