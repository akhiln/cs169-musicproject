class CreatePlaylistComments < ActiveRecord::Migration
  def self.up
    create_table :playlist_comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_comments
  end
end
