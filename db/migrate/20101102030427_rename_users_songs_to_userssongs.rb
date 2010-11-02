class RenameUsersSongsToUserssongs < ActiveRecord::Migration
  def self.up
    rename_table :usersong, :usersongs
  end

  def self.down
    rename_table :usersongs, :usersong
  end
end
