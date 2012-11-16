require "spec_helper"
describe "individual auction page" do
  let(:user) { FactoryGirl.create(:user) }
  before do
   @testAuction = FactoryGirl.create(:auction, user: user)
   visit '/auctions/1'
   end
  it "should render" do
    page.should_not have_content("404")
    page.should_not have_content("Routing Error")
    page.should_not have_content("Template")
  end

  it "should have product name" do
    page.should have_content(@testAuction.product)
  end

  it "should have base info" do
    page.should have_content(@testAuction.baseinfo)
  end

  it "should have current price" do
     page.should have_content(@testAuction.price)

  end

  it "should have end time" do

     page.should have_content (@testAuction.end_time)
  end

end
