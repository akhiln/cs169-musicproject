class CreatePlaylistRatings < ActiveRecord::Migration
  def self.up
    create_table :playlist_ratings do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_ratings
  end
end
