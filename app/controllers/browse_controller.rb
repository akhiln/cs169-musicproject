class BrowseController < ApplicationController
  before_filter :require_user

  def all
    @genres = Genre.all
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
