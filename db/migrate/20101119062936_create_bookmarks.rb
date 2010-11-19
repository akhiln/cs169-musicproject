class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
