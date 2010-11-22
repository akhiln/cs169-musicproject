class AddAttachmentToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :song_file_name, :string # Original filename
    add_column :songs, :song_content_type, :string # Mime type
    add_column :songs, :song_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :songs, :song_file_name
    remove_column :songs, :song_content_type
    remove_column :songs, :song_file_size
  end
end
