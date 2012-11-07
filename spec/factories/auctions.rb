# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :auction, class:Auction do
    seller_name 'bob'
	  price		10.00
	  product		'book shelf'
	  baseinfo	'tall, wooden 3 shelves'
    days  2
    hours 5
    end_time 53.hours.from_now.utc # hours needs to match days*24 + hours from above two lines
	 end
end
