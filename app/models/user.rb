class User < ActiveRecord::Base
	has_many :songs
	has_many :playlists
	
	validates_presence_of :name
end
