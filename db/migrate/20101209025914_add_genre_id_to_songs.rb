class AddGenreIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :genre_id, :integer
  end

  def self.down
    remove_column :songs, :genre_id
  end
end
