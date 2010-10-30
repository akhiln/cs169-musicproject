class CreateUsersSongs < ActiveRecord::Migration
  def self.up
    create_table :users_songs, :id=>false do |t|
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_songs
  end
end
