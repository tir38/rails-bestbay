# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :emptyAuction, class:Auction do
	#set no attributes
  end
  
  
  factory :auction, class:Auction do
	seller_name 'bob'
	price		10.00
	product		'book shelf'
	baseinfo	'tall, wooden 3 shelves'
	start_time 	'12:00:00'
	 
  end
end
