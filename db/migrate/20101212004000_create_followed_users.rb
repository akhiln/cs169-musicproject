class CreateFollowedUsers < ActiveRecord::Migration
  def self.up
    create_table :followed_users do |t|
      t.integer :user_id
      t.integer :followed_user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :followed_users
  end
end
