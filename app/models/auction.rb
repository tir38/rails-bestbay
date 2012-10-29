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
#  start_time         :string(255)
#  highestBidderEmail :string(255)
#  bid                :boolean
#

class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :end_time, :highestBidderEmail, :days, :hours

	validates  :price, presence: true
  validates :baseinfo, length: { maximum: 50 }
  validates :seller_name, length: { maximum: 50 }
  validates :product, presence: true, length: { maximum: 50 }
  validates :days,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  validates :hours,:presence => true, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
end
