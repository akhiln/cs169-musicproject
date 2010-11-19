class CreateForiegnKeysForComments < ActiveRecord::Migration
  def self.up
    add_column :song_comments, :song_id, :integer
    add_column :playlist_comments, :playlist_id, :integer
    add_column :song_comments, :user_id, :integer
    add_column :playlist_comments, :user_id, :integer
  end
 
  def self.down
    remove_column :song_comments, :song_id
    remove_column :song_comments, :user_id
    remove_column :playlist_comments, :playlist_id
    remove_column :playlist_comments, :user_id
  end
end

