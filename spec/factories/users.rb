# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Keegan"
  	last_name "Hawkeswood"
  	sequence(:email) {|n| "keegan#{n}@gmail.com" }
  	password "password"
  end
end
