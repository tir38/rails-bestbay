# == Schema Information
#
# Table name: auctions
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :decimal(, )
#  product            :string(255)
#  seller_name        :string(255)
#  baseinfo           :string(255)
#  highestBidderEmail :string(255)
#  bid                :boolean
#  days               :integer
#  hours              :integer
#  end_time           :datetime
#

require 'spec_helper'
describe Auction do  # tests for the model
    let(:user) { FactoryGirl.create(:user) }
    before { @auction = user.auctions.build(seller_name:"bob", price:10.00, product:"book shelf",
             baseinfo:"tall, wooden 3 shelves", days:2, hours:5, end_time: 53.hours.from_now.utc)}
     subject { @auction }

    it { should respond_to(:seller_name)}
    it { should respond_to(:price)}
    it { should respond_to(:product)}
    it { should respond_to(:baseinfo)}
    it { should respond_to(:days)}
    it { should respond_to(:hours)}
    it { should respond_to(:end_time)}
    it { should respond_to(:user_id) }

    it { should be_valid }

    describe "when user_id is not present" do
      before { @auction.user_id = nil }
      it { should_not be_valid }
    end

    describe "accessible attributes" do
      it "should not allow access to user_id" do
        expect do
          Auction.new(user_id: user.id)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end

end
