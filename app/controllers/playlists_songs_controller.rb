class PlaylistsSongsController < ApplicationController
  # GET /playlists_songs
  # GET /playlists_songs.xml
  def index
    @playlists_songs = PlaylistsSongs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @playlists_songs }
    end
  end

  # GET /playlists_songs/1
  # GET /playlists_songs/1.xml
  def show
    @playlists_songs = PlaylistsSongs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @playlists_songs }
    end
  end

  # GET /playlists_songs/new
  # GET /playlists_songs/new.xml
  def new
    @playlists_songs = PlaylistsSongs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @playlists_songs }
    end
  end

  # GET /playlists_songs/1/edit
  def edit
    @playlists_songs = PlaylistsSongs.find(params[:id])
  end

  # POST /playlists_songs
  # POST /playlists_songs.xml
  def create
    @playlists_songs = PlaylistsSongs.new(params[:playlists_songs])

    respond_to do |format|
      if @playlists_songs.save
        format.html { redirect_to(@playlists_songs, :notice => 'PlaylistsSongs was successfully created.') }
        format.xml  { render :xml => @playlists_songs, :status => :created, :location => @playlists_songs }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @playlists_songs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /playlists_songs/1
  # PUT /playlists_songs/1.xml
  def update
    @playlists_songs = PlaylistsSongs.find(params[:id])

    respond_to do |format|
      if @playlists_songs.update_attributes(params[:playlists_songs])
        format.html { redirect_to(@playlists_songs, :notice => 'PlaylistsSongs was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @playlists_songs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists_songs/1
  # DELETE /playlists_songs/1.xml
  def destroy
    @playlists_songs = PlaylistsSongs.find(params[:id])
    @playlists_songs.destroy

    respond_to do |format|
      format.html { redirect_to(playlists_songs_url) }
      format.xml  { head :ok }
    end
  end
end
