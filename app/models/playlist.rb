class Playlist < ActiveRecord::Base
	has_many :songs, :through => :PlaylistsSongs
	belongs_to :user
	
	validates_presence_of :name, :user_id
end
