Admin.create!(
  email: ENV['admin_email'],
  password: ENV['admin_password']
)

  # 利用者
10.times do |n|
  User.create!(
    email: "test#{n+1}@test",
    name: "test#{n+1}",
    postcode: "1500041",
    prefecture_code: "東京都",
    address_city: "北区",
    sex: "男性",
    address_street: "神南123",
    address_building: "ライオンズマンション123号室",
    introduction: "サウナ好きの人です。よろしくお願いします",
    password: "111111",
    )
end
  
  #サウナ

  Sauna.create!(
    name:"かるまる",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/karumaru.jpg"),
    postcode:"171-0014",
    prefecture_code:"13",
    address_city:"豊島区",
    address_street:"池袋2丁目",
    introduction:"日本最大級のサウナ施設です",
    business_hour:"11:30〜翌10:00",
    tel:"06-3986-3726",
    home_page:"https://karumaru.jp/ikebukuro/",
    water_temperature:"8.3",
    sauna_temperature:"90",
  )

  Sauna.create!(
    name:"天空のアジト マルシンスパ",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/marushinn.jpg"),
    postcode:"151-0073",
    prefecture_code:"13",
    address_city:"渋谷区",
    address_street:"笹塚1丁目58-6",
    address_building:"マルシンビル10F",
    introduction:"まさに天空にいる様な気分になります",
    business_hour:"12:00〜翌9:00 土日は24時間営業",
    tel:"05-3376-5225",
    home_page:"http://marushinspa.jp/",
    water_temperature:"18",
    sauna_temperature:"110",
  )

  Sauna.create!(
    name:"天然温泉 満天の湯",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/manntenn.jpg"),
    postcode:"277-0911",
    prefecture_code:"14",
    address_city:"横浜市",
    address_street:"保土ケ谷区上星川３丁目１-１",
    introduction:"自家製生薬風呂は香り良く効用も魅力。こちらの水風呂はミント水風呂15.5水深90cmとレベル高い。水風呂に12分計設置のきめこまやかさ！",
    business_hour:"6時00分～1時00分",
    tel:"05-3116-5225",
    home_page:"http://thermae-yu.jp/",
    water_temperature:"16.4",
    sauna_temperature:"80",
  )

  Sauna.create!(
    name:"おふろcafe utatane",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/ofuro-cafe.jpg"),
    postcode:"331-0815",
    prefecture_code:"11",
    address_city:"さいたま市",
    address_street:"北区大成町４丁目１７９−３",
    introduction:"コミック書籍 10,000冊以上 ・女性浴室で泥パック使い放題 ・2020年1月より試験的にタトゥー入館可(顔写真付き身分証の提示と会員登録220円が必須・サウナハットかけるフックなし。棚もなくサウナハット置き場なし。",
    business_hour:"10時00分～21時00分",
    tel:"05-3336-5225",
    home_page:"	http://ofurocafe-utatane.com/",
    water_temperature:"18",
    sauna_temperature:"88",
  )

  Sauna.create!(
    name:"カプセルホテルレインボー本八幡",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/ofuro-cafe.jpg"),
    postcode:"272-0023",
    prefecture_code:"12",
    address_city:"市川市",
    address_street:"南八幡４丁目４-１-１２",
    introduction:"コミック書籍 10,000冊以上 顔写真付き身分証の提示と会員登録220円が必須） ・サウナハットかけるフックなし。棚もなくサウナハット置き場なし。",
    business_hour:"10時00分～21時00分",
    tel:"05-3111-5225",
    home_page:"http://rainbow-motoyawata.wix.com/rainbow",
    water_temperature:"16",
    sauna_temperature:"126",
  )

  Sauna.create!(
    name:"新宿天然温泉 テルマー",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/teruma-yu.jpg"),
    postcode:"160-0021",
    prefecture_code:"13",
    address_city:"新宿区",
    address_street:"歌舞伎町１丁目１-２",
    introduction:"温浴施設（スーパー銭湯・サウナ・スパ施設）",
    business_hour:"24時間",
    tel:"03-5285-5435",
    home_page:"http://thermae-yu.jp/",
    water_temperature:"15",
    sauna_temperature:"94",
  )

  Sauna.create!(
    name:"ニコーリフレSAPPORO",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/refre.jpeg"),
    postcode:"060-0063",
    prefecture_code:"1",
    address_city:"札幌市",
    address_street:"中央区 南３条西２丁目14番地",
    introduction:"北海道といえばここ。水風呂が気持ち良すぎます",
    business_hour:"24時間",
    tel:"011-261-0108",
    home_page:"	http://www.nikoh.info/",
    water_temperature:"16",
    sauna_temperature:"86",
  )

  Sauna.create!(
    name:"金春湯",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/kinnharu.jpg"),
    postcode:"104-0061",
    prefecture_code:"13",
    address_city:"品川区",
    address_street:"大崎３丁目１８−８",
    introduction:"北海道といえばここ。水風呂が気持ち良すぎます",
    business_hour:"15時30分～24時00分、火曜日定休日",
    tel:"03-3492-4150",
    home_page:"http://kom-pal.com/",
    water_temperature:"16",
    sauna_temperature:"95",
  )

  Sauna.create!(
    name:"ホテルクワビオ",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/kuwabio.jpg"),
    postcode:"377-1711",
    prefecture_code:"10",
    address_city:"吾妻郡草津町",
    address_street:"草津226-63",
    introduction:"本格フレンチ・マクロビオティックやファスティングプランを提供しているウェルネスリゾートであり、各種人気ホテルランキングや特集の常連",
    business_hour:"	チェックイン15:00、チェックアウト11:00。レイトチェックアウトサービスもあり。",
    tel:"012-089-0932",
    home_page:"http://kurbio.com/",
    water_temperature:"14",
    sauna_temperature:"77",
  )

  Sauna.create!(
    name:"御老公の湯 境店",
    user_id:"1",
    image: File.open("./app/assets/images/saunas/gotoukou.jpg"),
    postcode:"306-0433",
    prefecture_code:"8",
    address_city:"境町",
    address_street:"1327-1",
    introduction:"ロッカーと浴場までがかなり離れていて迷ってしまう。 和テイストであったり洋風である",
    business_hour:"10時00分～9時00分",
    tel:"028-033-4126",
    home_page:"http://5650-sakai.jp/",
    water_temperature:"16.4",
    sauna_temperature:"88",
  )

  Food.create!(
    user_id:"1",
    sauna_id:"1",
    name:"かるまる特製 ビーフカレー",
    image:File.open("./app/assets/images/food/curry.jpg"),
    introduction:"かるまる特製のカレーがサウナ後の食欲を誘います",
    tel:"09-834-4748",
    home_page:"https://karumaru.jp/ikebukuro/"
  )

  Food.create!(
    user_id:"1",
    sauna_id:"2",
    name:"マルシン名物の自家製チャーシュー",
    image:File.open("./app/assets/images/food/cha-shu.jpg"),
    introduction:"天空のアジト特製のチャーシューはサウナをより好きにさせるはず！",
    tel:"049-114-4748",
    home_page:"http://marushinspa.jp/",
  )


  # ジャンル
  Genre.create(name: "ドライ", image: File.open("./app/assets/images/genres/dry.jpg"))
  Genre.create(name: "塩", image: File.open("./app/assets/images/genres/salt.jpg"))
  Genre.create(name: "スチーム", image: File.open("./app/assets/images/genres/steam.jpg"))
  Genre.create(name: "ミスト", image: File.open("./app/assets/images/genres/misuto.jpg"))
  Genre.create(name: "薬草", image: File.open("./app/assets/images/genres/yakusou.jpg"))
  Genre.create(name: "韓国式", image: File.open("./app/assets/images/genres/korea.jpg"))
  Genre.create(name: "ロウリュウ", image: File.open("./app/assets/images/genres/rouryuu.jpg"))
  Genre.create(name: "遠赤外線", image: File.open("./app/assets/images/genres/sekigaisenn.jpg"))
  Genre.create(name: "ストーン", image: File.open("./app/assets/images/genres/suto-nn.jpg"))

  #イキタイ

  Ikitai.create!(
    user_id:"1",
    sauna_id:"1",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"2",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"3",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"4",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"5",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"6",
  )
  Ikitai.create!(
    user_id:"2",
    sauna_id:"1",
  )
  Ikitai.create!(
    user_id:"2",
    sauna_id:"2",
  )
  Ikitai.create!(
    user_id:"2",
    sauna_id:"3",
  )
  Ikitai.create!(
    user_id:"2",
    sauna_id:"6",
  )
  Ikitai.create!(
    user_id:"9",
    sauna_id:"2",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"7",
  )
  Ikitai.create!(
    user_id:"5",
    sauna_id:"1",
  )
  Ikitai.create!(
    user_id:"1",
    sauna_id:"7",
  )
  Ikitai.create!(
    user_id:"5",
    sauna_id:"2",
  )
  Ikitai.create!(
    user_id:"10",
    sauna_id:"9",
  )
  Ikitai.create!(
    user_id:"10",
    sauna_id:"10",
  )
  Ikitai.create!(
    user_id:"2",
    sauna_id:"8",
  )
  
  #フォロー

  Relationship.create!(
    follower_id: 1,
    followed_id: 2
  )
  Relationship.create!(
    follower_id: 3,
    followed_id: 1
  )
  Relationship.create!(
    follower_id: 1,
    followed_id: 5
  )
  Relationship.create!(
    follower_id: 1,
    followed_id: 7
  )
  Relationship.create!(
    follower_id: 4,
    followed_id: 7
  )
  Relationship.create!(
    follower_id: 3,
    followed_id: 6
  )
  Relationship.create!(
    follower_id: 6,
    followed_id: 3
  )
  Relationship.create!(
    follower_id: 2,
    followed_id: 1
  )
  Relationship.create!(
    follower_id: 2,
    followed_id: 9
  )
  Relationship.create!(
    follower_id: 1,
    followed_id: 10
  )
  Relationship.create!(
    follower_id: 10,
    followed_id: 1
  )

