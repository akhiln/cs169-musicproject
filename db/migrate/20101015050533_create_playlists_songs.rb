class CreatePlaylistsSongs < ActiveRecord::Migration
  def self.up
    create_table :playlists_songs, :id=>false do |t|
      t.integer :playlist_id
      t.integer :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :playlists_songs
  end
end
