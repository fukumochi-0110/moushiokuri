FactoryBot.define do
  factory :task do
    text { Faker::Lorem.sentence }
    name { Faker::Name.last_name }
    due_date { Faker::Time.between(from: '2023-01-01', to: '2033-12-31', format: :default) }
    completed{ false }

    association :event_date
    association :unit
  end
end
