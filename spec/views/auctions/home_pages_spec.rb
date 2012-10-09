require "spec_helper"

describe "Home pages" do
  #before { }
  it "should render the home page" do
    visit '/auctions/home'
    page.should_not have_content("404")
  end

end