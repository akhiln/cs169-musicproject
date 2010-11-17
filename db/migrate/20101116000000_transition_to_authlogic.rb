class TransitionToAuthlogic < ActiveRecord::Migration
 
  def self.up
    change_column :users, :crypted_password, :string, :limit => 128, :null => false, :default => ""
    change_column :users, :salt, :string, :limit => 128, :null => false, :default => ""
 
    rename_column :users, :salt, :password_salt
    add_column :users, :password_reset_code, :string
    rename_column :users, :remember_token, :old_remember_token
    rename_column :users, :remember_token_expires_at, :old_remember_token_expires_at
    
    add_column :users, :activation_code, :string
    add_column :users, :login_count, :integer, :null => false, :default => 0
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0
    add_column :users, :last_request_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_ip, :string
    add_column :users, :last_login_ip, :string
 
    add_column :users, :persistence_token, :string
    add_column :users, :single_access_token, :string
    add_column :users, :perishable_token, :string
 
    add_column :users, :active, :boolean, :default => true, :null => false
 
    # set active users to active.
 
    add_index :users, :perishable_token
  end
 
  def self.down
    remove_column :users, :active
    remove_column :users, :perishable_token
    remove_column :users, :single_access_token
    remove_column :users, :persistence_token
    remove_column :users, :last_login_ip
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_at
    remove_column :users, :current_login_at
    remove_column :users, :last_request_at
    remove_column :users, :failed_login_count
    remove_column :users, :login_count
 
    rename_column :users, :password_salt, :salt
    remove_column :users, :activation_code
    remove_column :users, :password_reset_code
    rename_column :users, :old_remember_token, :remember_token
    rename_column :users, :old_remember_token_expires_at, :remember_token_expires_at
  end
end
