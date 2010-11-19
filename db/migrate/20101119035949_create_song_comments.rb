class CreateSongComments < ActiveRecord::Migration
  def self.up
    create_table :song_comments do |t|
      t.string :text
      t.int :user_id
      t.int :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :song_comments
  end
end
