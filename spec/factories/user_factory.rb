FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "username#{n}" }
    first_name "Xavier"
    last_name "Simo"

    factory :user_name_invalid do
      user_name "$%/"
    end
  end
end