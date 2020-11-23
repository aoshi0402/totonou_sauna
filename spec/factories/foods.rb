FactoryBot.define do
  factory :food do
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }
    name { Faker::Name.name }
    introduction { Faker::Lorem.characters(number: 20) }
    tel { '111-1111-1111' }
    home_page { Faker::Internet.url }
  end
end