class Playlist < ActiveRecord::Base
  has_many :playlist_comments
  has_many :playlistsongs
	has_many :songs, :through => :playlistsongs
 	belongs_to :user
	
	validates_presence_of :name, :user_id
end
