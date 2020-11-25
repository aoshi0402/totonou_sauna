FactoryBot.define do
  factory :review do
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 10) }
    score { rand(0..100) }
  end
end
