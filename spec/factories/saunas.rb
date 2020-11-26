FactoryBot.define do
  factory :sauna do
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }
    name { Faker::Lorem.characters(number: 10) }
    postcode { Faker::Address.postcode.gsub('-', '') }
    prefecture_code { rand(1..42) }
    address_city { Faker::Address.city }
    address_street { Faker::Address.street_name }
    address_building { Faker::Address.building_number }
    introduction { Faker::Lorem.characters(number: 30) }
    business_hour { Faker::Lorem.characters(number: 30) }
    home_page { Faker::Internet.url }
    tel { '111-1111-1111' }
    water_temperature { Faker::Lorem.characters(number: 2) }
    sauna_temperature { Faker::Lorem.characters(number: 2) }
    user
  end
end
