class AddSongNameField < ActiveRecord::Migration
  def self.up
	add_column :songs, :name, :string
	remove_column :songs, :source
  end

  def self.down
	add_column :songs, :source, :string
	remove_column :songs, :name
  end
end
