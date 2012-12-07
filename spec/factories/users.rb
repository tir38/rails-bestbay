# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user1,class:User do
    name     "Jason"
    email    "jwatwood@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :user2, class:User do
    name     "Hao"
    email    "yaohao.hi@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
