# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user, class: User do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
