class PlaylistsController < ApplicationController
	#before_filter :require_user
	def list
		@playlists = User.find(params[:id]).playlists
	end
	
	def show
		@playlist = Playlist.find(params[:id])
                @comments = @playlist.playlist_comments
		@songs = @playlist.songs
	end
	
	def new
		@playlist = Playlist.new
	end
	
	def create
		@playlist = Playlist.new(params[:playlist])
		@playlist.user_id = current_user.id
		@playlist.save
		redirect_to(@playlist, :notice => 'Playlist was successfully created.')
	end
	
	def delete
		Playlist.find(params[:id]).destroy
		redirect_to(current_user)
	end
	
	def addsong
		@song_id = params[:song_id]
		@song = Song.find(@song_id)
		@playlists = current_user.playlists
	end
	
	def confirmaddsong
		song_id = params[:song_id]
		playlist_id = params[:playlist]
		plsong = Playlistsong.new
		plsong.playlist_id = playlist_id
		plsong.song_id = song_id
		plsong.save
		pl = Playlist.find(playlist_id)
		redirect_to(pl, :notice => 'Playlist was successfully created.')
	end
        
  def popular
    @playlists = Playlist.find(:all, :readonly, :limit => 100, :order => "rating DESC")
    @playlists.shuffle!    
  end

  def my
    @playlists = current_user.playlists
    respond_to do |format|
      format.html   #Akhil makes it pretty
      format.xml   { render :xml => @playlists }
    end
  end

end
