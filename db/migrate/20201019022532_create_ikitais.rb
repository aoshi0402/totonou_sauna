class CreateIkitais < ActiveRecord::Migration[5.2]
  def change
    create_table :ikitais do |t|
      t.references :user, foreign_key: true
      t.references :sauna, foreign_key: true
      t.timestamps
    end
  end
end
