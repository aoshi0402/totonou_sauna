class CreateSaunaGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :sauna_genres do |t|
      t.integer "genre_id"
      t.integer "sauna_id"
      t.timestamps
    end
  end
end
