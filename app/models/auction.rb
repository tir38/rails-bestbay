# == Schema Information
#
# Table name: auctions
#
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  price              :decimal(, )
#  id                 :integer
#  product            :string(255)
#  seller_name        :string(255)
#  baseinfo           :string(255)
#  start_time         :string(255)
#  highestBidderEmail :string(255)
#

class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :start_time, :highestBidderEmail

	validates  :price,  :start_time, :presence => true
  validates :baseinfo, length: { maximum: 50 }
  validates :seller_name, length: { maximum: 10 }
  validates :product, presence: true, length: { maximum: 15 }
end
