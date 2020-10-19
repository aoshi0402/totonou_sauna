class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer "user_id", null: false
      t.string "name", null: false
      t.string "image_id", null: false
      t.text "introduction", null: false
      t.string "tel", null: false
      t.string "home_page", null: false
      t.timestamps
    end
  end
end
