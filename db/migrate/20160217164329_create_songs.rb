class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :duration
      t.string :album
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
