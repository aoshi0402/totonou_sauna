class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer "user_id", null: false
      t.integer "sauna_id", null: false
      t.string "name", null: false
      t.string "image_id", null: false
      t.text "introduction", null: false
      t.string "tel"
      t.string "home_page"
      t.timestamps
    end
  end
end
