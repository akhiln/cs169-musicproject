class ChangePluralDbNames < ActiveRecord::Migration
  def self.up
		rename_table :playlists_songs, :playlistsong
		rename_table :users_songs, :usersong
  end

  def self.down
  		rename_table :playlistsong, :playlists_songs
		rename_table :usersong, :users_songs
  end
end
