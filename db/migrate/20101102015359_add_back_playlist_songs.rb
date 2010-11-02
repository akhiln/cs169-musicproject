class AddBackPlaylistSongs < ActiveRecord::Migration
  def self.up
    create_table :users_songs do |t|
      t.integer :playlist_id
	  t.integer :song_id

      t.timestamps
    end
	remove_columns :songs, :user_id
  end

  def self.down
    drop_table :users_songs
	add_column :songs, :user_id, :integer
  end
end
