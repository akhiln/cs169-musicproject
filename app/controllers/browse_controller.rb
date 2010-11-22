class BrowseController < ApplicationController
  before_filter :require_user

  def all
    @songs = Song.find(:all, :select => 'DISTINCT genre')
    @genres = @songs.map {|s| s.genre}
    respond_to do |format|
      format.html
      format.xml { render :xml => @genres }
    end
  end

  def genre
    @genre = params[:id]
    @songs = Song.find_by_sql("SELECT * FROM songs WHERE songs.genre = '#{@genre}'")
    respond_to do |format|
      format.html
      format.xml { render :xml => @genres }
    end
  end
end
