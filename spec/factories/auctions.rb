# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    name     "Gorge"
    email    "Gorge@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :auction do
    seller_name "bob"
	  price		10.00
	  product		"book shelf"
	  baseinfo	"tall, wooden 3 shelves"
    days  2
    hours 5
    #end_time 53.hours.from_now.utc # hours needs to match days*24 + hours from above two lines
    user # We need to fix this in case we want two auctions in a single test. We'll get an error that it can't create two unique "Gorge" users
  end

end
