# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "FactoryGirl User"
    email "email@example.com"
    password "pass1word"
    
    factory :user1 do
      name "User1"
      email "user1@example.com"
    end

    factory :user2 do
      name "User2"
      email "user2@example.com"
    end
  end
end
