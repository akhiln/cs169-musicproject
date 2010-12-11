class SongCommentController < ApplicationController
  before_filter :require_user

  def new
     @song_comment = SongComment.new
     @song = Song.find(params[:song_id])
     respond_to do |format|
        format.html
        format.xml   { render :xml => @song_comment }
     end
  end

  def create
     @song_comment = SongComment.new(params[:song_comment])
     @song_comment.user_id = @current_user.id
     @song_comment.song_id = params[:song_id]
     @song = Song.find(params[:song_id])
     respond_to do |format|
      if @song_comment.save
        format.js do
          render :update do |page|
    		  page.insert_html :top, 'song_comments', :partial => 'song_comment/comment'
          end
        end

      else
        SongComment.delete(@song_comment.id)
        format.html { render :action => "new", :error => 'Your comment could not be saved. Please try again.'}
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end
end
