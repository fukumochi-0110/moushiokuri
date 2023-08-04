FactoryBot.define do
  factory :message do
    text {Faker::Lorem.sentence}
    name { Faker::Name.last_name }
    image {Faker::Lorem.sentence}
    association :event_date
    association :unit
  end
end
