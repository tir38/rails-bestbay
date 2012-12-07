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
#  status             :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Auction < ActiveRecord::Base

	attr_accessible  :price, :product, :baseinfo, :seller_name, :end_time, :highestBidderEmail,
                   :days, :hours, :status ,:photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                            :url  => "/assets/products/:id/:style/:basename.:extension",
                            :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

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
  #validate :setStatus
  default_scope order: 'auctions.created_at DESC'
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def days_and_hours
    # It may not validate days and hours separately before validating days_and_hours,
    # so I need to make sure that days and hours are both not NIL before trying to compute 'time'
    # I also only want to compute end_time if it has not been computed yet
    if (!self.days.nil? && !self.hours.nil?)

      if (self.end_time.nil?) # if end_time has not yet been computed

        if (self.days == 0 && self.hours == 0)
          self.errors[:base] << "Days and hours can not be zero."
        else
          time =  self.hours  + self.days*24
          self.end_time = time.minutes.from_now.utc
          self.setStatus # validate status after end time is set
        end
      end
    end
  end



  def setStatus
    # status must be one of the following strings
    # - open
    # - expired

   unless self.end_time.nil?
    if self.end_time < Time.now.utc
        unless self.status == "expired" # unless status has ALREADY been set to expired
          UserMailer.endAuction_confirmation_to_seller(self).deliver # send email
          UserMailer.endAuction_confirmation_to_bidder(self).deliver
          self.status = "expired"
          self.save
        end
    elsif self.end_time >= Time.now.utc
        self.status = "open"
        self.save
     else
        self.errors[:base] << "Auction status cannot be set"
     end
  end
end

end
