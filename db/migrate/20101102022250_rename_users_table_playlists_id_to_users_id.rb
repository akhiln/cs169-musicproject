class RenameUsersTablePlaylistsIdToUsersId < ActiveRecord::Migration
  def self.up
    rename_column :users_songs, :playlist_id, :user_id
  end

  def self.down
    rename_column :users_songs, :user_id, :playlist_id
  end
end
