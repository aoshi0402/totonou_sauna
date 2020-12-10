class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sauna, null: false, foreign_key: true
      t.string "name", null: false
      t.string "image_id", null: false
      t.text "introduction", null: false
      t.string "tel"
      t.string "home_page"
      t.timestamps
    end
  end
end
