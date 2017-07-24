FactoryGirl.define do
  factory :contact do
    name 'Contact'
    sequence(:email) { |n| "user#{n}@example.com" }
    phone '(00) 0000-0000'
  end
end
