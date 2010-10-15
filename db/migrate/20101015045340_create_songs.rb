class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :source
      t.string :album
      t.float :length
      t.string :genre
      t.text :description
      t.float :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
