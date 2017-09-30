class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title,      null: false
      t.string :picture,    null: false
      t.text :caption
      t.integer :album_id

      t.timestamps
    end

    add_index(:photos, :album_id)
    add_index(:photos, :picture)
  end
end
