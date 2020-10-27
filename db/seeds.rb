Admin.create!(
  email: ENV['admin_email'],
  password: ENV['admin_password']
)

10.times do |n|
  User.create!(
    email: "test#{n+1}@test",
    name: "test#{n+1}",
    postcode: "1500041",
    prefecture_code: "東京都",
    address_city: "北区",
    sex: "男",
    address_street: "神南123",
    address_building: "ライオンズマンション123号室",
    introduction: "サウナ好きの人です。よろしくお願いします",
    image_id:1,
    password: "111111",
    )
  end

#   10.times do |n|
#   Sauna.create!(
#     user_id:"1#{n+1}",
#     name:"かるまる#{n+1}",
#     image_id:"1#{n+1}",
#     postcode:"123456",
#     prefecture:"東京都",
#     address_city:"豊島区",
#     address_street:"池袋233",
#     address_building:"かるまるビル2階",
#     introduction:"国内最大級のサウナ施設です",
#     business_hour:"8:30から20:00",
#     tel:"0429673344",
#     home_page:"http/wwwwwwwwwwwwwww"
#   )
# end
