class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.string :name
      t.integer :user_id
      t.float :rating
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end
