class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :artist, foreign_key: true

      t.timestamps
    end

    add_index :albums, :title
  end
end
