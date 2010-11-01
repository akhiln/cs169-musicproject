class Playlist < ActiveRecord::Base
	has_many :playlists_songs
	belongs_to :user
	
	validates_presence_of :name, :user_id
end
