class CreateIkitais < ActiveRecord::Migration[5.2]
  def change
    create_table :ikitais do |t|
      t.bigint "user_id"
      t.bigint "sauna_id"
      t.timestamps
    end
  end
end
