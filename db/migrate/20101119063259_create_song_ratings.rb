class CreateSongRatings < ActiveRecord::Migration
  def self.up
    create_table :song_ratings do |t|
      t.int :rating
      t.int :user_id
      t.int :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :song_ratings
  end
end
