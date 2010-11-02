class RenamePlaylistsSongsToPlaylistsongs < ActiveRecord::Migration
  def self.up
    rename_table :playlistsong, :playlistsongs
  end

  def self.down
    rename_table :playlistsongs, :playlistsong
  end
end
