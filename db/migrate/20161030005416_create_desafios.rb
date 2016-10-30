class CreateDesafios < ActiveRecord::Migration
  def change
    create_table :desafios do |t|
      t.string :tipo
      t.string :titulo
      t.string :descripcion
      t.integer :puntos

      t.timestamps null: false
    end
  end
end
