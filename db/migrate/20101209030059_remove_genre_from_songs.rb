class RemoveGenreFromSongs < ActiveRecord::Migration
  def self.up
    remove_column :songs, :genre
  end

  def self.down
    add_column :songs, :genre, :string
  end
end
