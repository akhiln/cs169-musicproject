class CreatePlaylistComments < ActiveRecord::Migration
  def self.up
    create_table :playlist_comments do |t|
      t.string :text
      t.int :user_id
      t.int :playlist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_comments
  end
end
