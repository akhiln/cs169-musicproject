class Playlist < ActiveRecord::Base
  has_many :playlistsongs
	has_many :songs, :through => :playlistsongs
 	belongs_to :user
	
	validates_presence_of :name, :user_id
	
	def self.addSongToPlaylist(playlist_id, song_id)
		plsong = PlaylistSongs.new
		plsong.playlist_id = playlist_id
		plsong.song_id = song_id
		plsong.save
	end
	
	def addSong(song_id)
		plsong = PlaylistSongs.new
		plsong.playlist_id = @id
		plsong.song_id = song_id
		plsong.save
	end
end
