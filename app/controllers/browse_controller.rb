class BrowseController < ApplicationController
  #before_filter :require_user

  def all
    @genres = Genre.find(:all, :include=>[:songs], :order=>:genre_name)
    @genres.reject! do |genre|
      genre.songs.size == 0
    end
    respond_to do |format|
      format.html
      format.xml { render :xml => @genres }
    end
  end

  def genre
    @genre = params[:id]
    @songs = Genre.find_by_genre_name(@genre).songs
    respond_to do |format|
      format.html
      format.xml { render :xml => @genres }
    end
  end
end
