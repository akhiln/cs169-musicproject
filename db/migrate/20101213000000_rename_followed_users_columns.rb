class RenameFollowedUsersColumns < ActiveRecord::Migration
  def self.up
    rename_column :followed_users, :user_id, :subscriber_id
    rename_column :followed_users, :followed_user_id, :followed_id
  end

  def self.down
    rename_column :followed_users, :subscriber_id, :user_id
    rename_column :followed_users, :followed_id, :followed_user_id
  end
end
