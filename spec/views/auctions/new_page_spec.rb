require "spec_helper"

describe "New Post page" do
  #before { }
  it "should render the New Post page" do
    visit '/auctions/new'
    page.should_not have_content("404")
    page.should_not have_content("Routing Error")
    page.should_not have_content("Template")
  end

end
