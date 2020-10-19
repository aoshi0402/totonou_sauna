class CreateIkitais < ActiveRecord::Migration[5.2]
  def change
    create_table :ikitais do |t|
      t.integer "user_id"
      t.integer "sauna_id"
      t.timestamps
    end
  end
end
