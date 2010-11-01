class PlaylistsSongs < ActiveRecord::Base
	belongs_to :playlist
	
	validates_presence_of :playlist_id, :song_id
end
