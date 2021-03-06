class CreateSaunas < ActiveRecord::Migration[5.2]
  def change
    create_table :saunas do |t|
      t.bigint "user_id", null: false
      t.references :user, null: false, foreign_key: true
      t.string "name", null: false
      t.string "image_id"
      t.string "postcode", null: false
      t.integer "prefecture_code", null: false
      t.string "address_city", null: false
      t.string "address_street", null: false
      t.string "address_building"
      t.text "introduction", null: false
      t.string "business_hour", null: false
      t.string "tel", null: false
      t.string "home_page"
      t.string "business_hour", null: false
      t.string "water_temperature", null: false
      t.string "sauna_temperature", null: false
      t.integer "impressions_count", default: 0
      t.float "latitude"
      t.float "longitude"
      t.timestamps
    end
  end
end
