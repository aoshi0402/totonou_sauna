FactoryBot.define do
  factory :message do
    body { Faker::Lorem.characters(number: 20) }
  end
end
