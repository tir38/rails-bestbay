# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user1,class:User do
    name     "alekhya"
    email    "alekhya@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :user2, class:User do
    name     "Jason"
    email    "jason@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
