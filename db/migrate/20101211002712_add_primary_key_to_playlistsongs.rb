class AddPrimaryKeyToPlaylistsongs < ActiveRecord::Migration
  def self.up
    drop_table :playlistsongs
    create_table :playlistsongs do |t|
      t.integer :playlist_id
      t.integer :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :playlistsongs
    create_table :playlistsongs, :id => false do |t|
      t.integer :playlist_id
      t.integer :song_id

      t.timestamps
    end
  end
end
