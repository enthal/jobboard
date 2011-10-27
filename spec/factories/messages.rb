# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    user
    job
    body "Some message text"
  end
end
