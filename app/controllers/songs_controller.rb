class SongsController < ApplicationController
  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
        @users_songs = UsersSongs.new({:user_id => @current_user.id, :song_id => @song.id})
        if @users_songs.save
          @song.upload(params[:upload])
          format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
          format.xml  { render :xml => @song, :status => :created, :location => @song }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new
    @song = Song.new
    respond_to do |format|
      format.html
      format.xml   { render :xml => @song }
    end
  end
  
  def create
  end

end
