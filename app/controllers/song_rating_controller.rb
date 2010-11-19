class SongRatingController < ApplicationController
  before_filter :require_user

  def new
     @song_rating = SongRating.new
     @song = Song.find(params[:song_id])
     respond_to do |format|
        format.html
        format.xml   { render :xml => @song_comment }
     end
  end

  def create
     @song_rating = SongRating.new(params[:song_rating])
     @song_rating.user_id = @current_user.id
     @song_rating.song_id = params[:song_id]
     @song = Song.find(params[:song_id])
     if @song_rating.save
       redirect_to(@song, :notice => 'Rating was successfully created.')
     else
       SongRating.delete(@song_rating.id)
       format.html { render :action => "new", :error => 'Your rating could not be saved. Please try again.'}
       format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
     end
  end
end
