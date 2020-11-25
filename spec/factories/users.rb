FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    postcode { Faker::Address.postcode.gsub('-', '') }
    prefecture_code { rand(1..42) }
    address_city { Faker::Address.city }
    address_street { Faker::Address.street_name }
    address_building { Faker::Address.building_number }
    introduction { Faker::Lorem.characters(number: 100) }
    email { Faker::Internet.email }
    password { '111111' }
    password_confirmation { '111111' }
  end
end
