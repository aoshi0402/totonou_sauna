class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sauna, null: false, foreign_key: true
      t.string "title", null: false
      t.integer "score", null: false
      t.text "body", null: false
      t.timestamps
    end
  end
end
