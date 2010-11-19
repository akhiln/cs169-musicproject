class CreateSongRatings < ActiveRecord::Migration
  def self.up
    create_table :song_ratings do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :song_ratings
  end
end
