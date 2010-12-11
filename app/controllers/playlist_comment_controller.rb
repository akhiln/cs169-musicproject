class PlaylistCommentController < ApplicationController

before_filter :require_user

  def new
     @playlist_comment = PlaylistComment.new
     @playlist = Playlist.find(params[:playlist_id])
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
     respond_to do |format|
      if @playlist_comment.save
        format.js do
          render :update do |page|
            page.insert_html :top, 'playlist_comments', :partial => 'playlist_comment/comment'
          end
        end
     else
       PlaylistComment.delete(@playlist_comment.id)
       format.html { render :action => "new", :error => 'Your comment could not be saved. Please try again.'}
       format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
     end
    end
  end
end
