FactoryBot.define do
factory :contact do
  name { Faker::Name.name }
  email { Faker::Internet.email }
  title { Faker::Lorem.characters(number: 10) }
  body { Faker::Lorem.characters(number: 20) }
  end
end