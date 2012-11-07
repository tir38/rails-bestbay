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

class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :end_time, :highestBidderEmail, :days, :hours
  #before_save {|auction| auction.highestBidderEmail = highestBidderEmail.downcase }

	validates  :price, presence: true
  validates :baseinfo, length: { maximum: 50 }
  validates :seller_name, length: { maximum: 50 }
  validates :product, presence: true, length: { maximum: 50 }
  validates :days,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  validates :hours,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }


  def compute_end_time
    # assumes that days and hours are already valid
    time = self.days*24 + self.hours

    if time > 1
      self.end_time =  time.hours.from_now.utc
      self.save

    else
      self.errors[:base] << "Auction duration too short"
      self.delete

    end
  end
end
