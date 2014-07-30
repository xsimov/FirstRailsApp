FactoryGirl.define do
  factory :visit do
    from_date { Time.now + 1.month }
    to_date { Time.now + 2.month }
    association :location
    association :user
  end
end