class PlaylistsController < ApplicationController
	def list
		@playlists = User.find(params[:id]).playlists
	end
	
	def show
		@playlist = Playlist.find(params[:id])
		@songs = @playlist.songs
	end
	
	def new
		@playlist = Playlist.new
	end
	
	def create
		@playlist = Playlist.new(params[:playlist])
		@playlist.user_id = @current_user.id
		@playlist.save
		redirect_to(@playlist, :notice => 'Playlist was successfully created.')
	end
	
	def delete
		Playlist.find(params[:id]).destroy
	end
end
