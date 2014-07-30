FactoryGirl.define do
  factory :location do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Location #{n}" }
    city "Barcelona"
    street "Baker"
    zip_code "08080"
    description "Some random text"
  end
end