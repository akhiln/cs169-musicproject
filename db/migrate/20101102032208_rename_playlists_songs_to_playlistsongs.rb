class RenamePlaylistsSongsToPlaylistsongs < ActiveRecord::Migration
  def self.up
    rename_table :playlists_songs, :playlistsongs
  end

  def self.down
    rename_table :playlistsongs, :playlists_songs
  end
end
