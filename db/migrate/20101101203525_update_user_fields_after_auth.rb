class UpdateUserFieldsAfterAuth < ActiveRecord::Migration
  def self.up
	add_column :users, :pic, :string
	add_column :users, :bio, :string
  end

  def self.down
	remove_column :users, :pic
	remove_column :users, :bio
  end
end
