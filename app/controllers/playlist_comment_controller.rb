class PlaylistCommentController < ApplicationController

before_filter :require_user

  def new
     @playlist_comment = PlaylistComment.new
     @playlist = Playlist.find(params[:song_id])
     respond_to do |format|
        format.html
        format.xml   { render :xml => @playlist_comment }
     end
  end

  def create
     @playlist_comment = PlaylistComment.new(params[:playlist_comment])
     @playlist_comment.user_id = @current_user.id
     @playlist_comment.playlist_id = params[:playlist_id]
     @playlist = Playlist.find(params[:playlist_id])
     if @playlist_comment.save
       redirect_to(@playlist, :notice => 'Comment was successfully created.')
     else
       SongComment.delete(@song_comment.id)
       format.html { render :action => "new", :error => 'Your comment could not be saved. Please try again.'}
       format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
     end
  end
end
