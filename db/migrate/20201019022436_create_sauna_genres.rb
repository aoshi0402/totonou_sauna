class CreateSaunaGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :sauna_genres do |t|
      t.references :genre, foreign_key: true
      t.references :sauna, foreign_key: true
      t.timestamps
    end
  end
end
