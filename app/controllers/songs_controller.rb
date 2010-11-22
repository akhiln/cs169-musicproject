class SongsController < ApplicationController
  # POST /songs
  # POST /songs.xml
  before_filter :require_user

  def create
     @song = Song.new(params[:song])
     respond_to do |format|      
       if @song.save
         @users_songs = Usersong.new({:user_id => @current_user.id, :song_id => @song.id})
        if @users_songs.save
         format.html { redirect_to(@song, :notice => 'Song was successfully created.') } 
         format.xml  { render :xml => @song, :status => :created, :location => @song }
        else
         format.html { render :action => "new" }
         format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
       end
      end
    end
  end

  #this is the old create method that stores songs on the localFS
  #def create
  #  @song = Song.new(params[:song])
  #  respond_to do |format|      
  #    if @song.save
  #      @users_songs = Usersong.new({:user_id => @current_user.id, :song_id => @song.id})
  #      if @users_songs.save
  #        if @song.upload(params[:upload])  #Happy path
  #          format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
  #          format.xml  { render :xml => @song, :status => :created, :location => @song }
  #        else
  #          Song.delete(@song.id)
  #          Usersong.delete(@users_songs.id)
  #          format.html { render :action => "new" }
  #          format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
  #        end
  #      else  #Sad path
  #        Song.delete(@song.id)
  #        format.html { render :action => "new" }
  #        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
  #      end
  #    else  #Sad path
  #      format.html { render :action => "new" }
  #      format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
  #    end
 #   end
 # end
  
  def new
    @song = Song.new
    respond_to do |format|
      format.html
      format.xml   { render :xml => @song }
    end
  end
  
  def show
    @song = Song.find(params[:id])
    @comments = @song.song_comments
    if @song.users.include?(@current_user)
      @auth = true
    else
      @auth = false
    end
    respond_to do |format|
      format.html
      format.xml   { render :xml => @song }
    end
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @Song.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def index
    @Songs = Song.find(:all)
    if @Songs == nil
      @Songs = []
    end
    respond_to do |format|
      format.html
      format.xml   { render :xml => @song }
    end
  end
  
  def delete
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to(@current_user, :notice => "Song successfully deleted")
  end
  
  def my
    @songs = current_user.songs
    respond_to do |format|
      format.html   #Akhil makes it pretty
      format.xml   { render :xml => @songs }
    end
  end

  def popular
    @songs = Song.find(:all, :readonly, :limit => 100, :order => "rating DESC")
    @songs.shuffle!    
  end
  
end
