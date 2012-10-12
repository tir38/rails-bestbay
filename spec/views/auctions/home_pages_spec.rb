require "spec_helper"

describe "Index page" do
  #before { }
  it "should render the index page" do
    visit '/auctions'
    page.should_not have_content("404")
  end

end
