# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  auction_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WatchList < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence:true
  validates :auction_id, presence:true
end
