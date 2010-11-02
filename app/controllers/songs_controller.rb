class SongsController < ApplicationControllers
  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
		@song.upload(params[:upload])
        format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

end
