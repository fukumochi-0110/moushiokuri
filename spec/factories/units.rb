FactoryBot.define do
  factory :unit do
    name {Faker::Company.name}
    association :user
  end
end
