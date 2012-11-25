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
#  days               :integer
#  hours              :integer
#  end_time           :datetime
#  user_id            :integer
#

class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :end_time, :highestBidderEmail,
                   :days, :hours
  #before_save {|auction| auction.highestBidderEmail = highestBidderEmail.downcase }
  belongs_to :user

	validates  :price, presence: true,  :numericality => { :greater_than => 0}
  validates :baseinfo, length: { maximum: 50 }
  validates :seller_name, length: { maximum: 50 }
  validates :product, presence: true, length: { maximum: 50 }
  validates :days,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  validates :hours,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  validates :user_id, presence:true
  validate :days_and_hours
  default_scope order: 'auctions.created_at DESC'

  def days_and_hours
    # It may not validate days and hours separately before validating days_and_hours,
    # so I need to make sure that days and hours are both not NIL before trying to compute 'time'
    # I also only want to compute end_time
    if (!self.days.nil? && !self.hours.nil?)

      if (self.end_time.nil?) # if end_time has not yet been computed

        if (self.days == 0 && self.hours == 0)
          self.errors[:base] << "Days and hours can not be zero."
        else
          time = self.days*24 + self.hours
          self.end_time = time.hours.from_now.utc
        end
      end
    end
  end

end
