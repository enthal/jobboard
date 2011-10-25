# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "FactoryGirl User"
    email "email@example.com"
    password "pass1word"
  end
end