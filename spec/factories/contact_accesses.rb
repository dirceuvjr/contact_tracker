FactoryGirl.define do
  factory :contact_access do
    url 'MyString'
    visiting_date DateTime.now

    association :contact, strategy: :build
  end
end
