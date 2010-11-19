class SongCommentController < ApplicationController

  def new
     @song_comment = SongComment.new
     @song = Song.find(params[:song_id])
     respond_to do |format|
        format.html
        format.xml   { render :xml => @song_comment }
  end

  def create
     @song_comment = SongComment.new(params[:song_comment])
     @song_comment.user_id = @current_user.id
     @song_comment.song_id = params[:song_id]
  end
end
