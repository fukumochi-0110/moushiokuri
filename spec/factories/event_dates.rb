FactoryBot.define do
  factory :event_date do
    event_date {Faker::Date.between(from: '2023-01-01', to: '2033-12-31')}
  end
end
