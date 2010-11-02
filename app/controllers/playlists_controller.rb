class PlaylistsController < ApplicationController
	def list
		@playlists = User.find(params[:id]).playlists
	end
	
	def view
		@songs = Playlist.find(params[:id]).songs
	end
	
	def new
		@playlist = Playlist.new
	end
	
	def create
		@playlist = Playlist.new
		@playlist.user_id = @current_user.id
		@playlist.name = params[:name]
		@playlist.description = params[:description]
		@platlist.rating = params[:rating]
		@playlist.save
	end
	
	def delete
		Playlist.find(params[:id]).destroy
	end
end
