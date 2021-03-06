class PlaylistsController < ApplicationController
	#before_filter :require_user
	def list
		@playlists = User.find(params[:id]).playlists
	end
	
	def show
		@playlist = Playlist.find(params[:id])
                @comments = @playlist.playlist_comments
		@urlif = 'http://project-jukebox.heroku.com/index?url=/playlists/' + @playlist.id.to_s
		@urlif << '%26title='
		@urlif << @playlist.name
		@songs = @playlist.songs
	end
	
	def new
		@playlist = Playlist.new
	end
	
	def create
		@playlist = Playlist.new(params[:playlist])
		@playlist.user_id = current_user.id
		@playlist.save
          @action = Action.new :user_id => @playlist.user_id, :action =>"create", :obj_type =>"playlist", :obj_id => @playlist.id
          @action.save
		redirect_to(@playlist, :notice => 'Playlist was successfully created.')
	end
	
	def delete
		playlist = Playlist.find(params[:id])
                actions = Action.find(:all, :conditions => {"obj_id" => playlist.id.to_s, "obj_type" =>"palylist"})
                actions.each {|act| act.destroy}
                bookmarks = Bookmark.find(:all, :conditions => {"playlist_id" => playlist.id.to_s})
                bookmarks.each {|bk| bk.destroy}
                playlist.destroy
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
		@confirm = plsong.save
		@pl = Playlist.find(playlist_id)
		@song = Song.find(song_id)
	end
        
  def popular
    @playlists = Playlist.find(:all, :readonly, :limit => 100, :order => "rating DESC")
    @playlists.shuffle!    
    @playlists = @playlists[0..[@playlists.size-1,20].min]
    @playlists.sort! {|b,a| (a.rating.nil? ? 0.0 : a.rating.to_d) <=> (b.rating.nil? ? 0.0 : b.rating.to_d) }
  end

  def my
    @playlists = current_user.playlists
    respond_to do |format|
      format.html   #Akhil makes it pretty
      format.xml   { render :xml => @playlists }
    end
  end

end
