class AlterDbForSongDependence < ActiveRecord::Migration
  def self.up
	drop_table :users_songs
	add_column :songs, :user_id, :integer
  end

  def self.down
	remove_column :songs, :user_id
	  create_table "users_songs", :id => false, :force => true do |t|
		t.integer  "user_id"
		t.integer  "song_id"
		t.datetime "created_at"
		t.datetime "updated_at"
	  end
  end
end
