class CreateSaunaGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :sauna_genres do |t|
      t.bigint "genre_id"
      t.bigint "sauna_id"
      t.timestamps
    end
  end
end
