# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :auction, class:Auction do
    seller_name 'bob'
	  price		10.00
	  product		'book shelf'
	  baseinfo	'tall, wooden 3 shelves'
    days  10
    hours 0
	 end
end
