class UsersSongsController < ApplicationController
  # GET /users_songs
  # GET /users_songs.xml
  def index
    @users_songs = UsersSongs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users_songs }
    end
  end

  # GET /users_songs/1
  # GET /users_songs/1.xml
  def show
    @users_songs = UsersSongs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users_songs }
    end
  end

  # GET /users_songs/new
  # GET /users_songs/new.xml
  def new
    @users_songs = UsersSongs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users_songs }
    end
  end

  # GET /users_songs/1/edit
  def edit
    @users_songs = UsersSongs.find(params[:id])
  end

  # POST /users_songs
  # POST /users_songs.xml
  def create
    @users_songs = UsersSongs.new(params[:users_songs])

    respond_to do |format|
      if @users_songs.save
        format.html { redirect_to(@users_songs, :notice => 'UsersSongs was successfully created.') }
        format.xml  { render :xml => @users_songs, :status => :created, :location => @users_songs }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @users_songs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_songs/1
  # PUT /users_songs/1.xml
  def update
    @users_songs = UsersSongs.find(params[:id])

    respond_to do |format|
      if @users_songs.update_attributes(params[:users_songs])
        format.html { redirect_to(@users_songs, :notice => 'UsersSongs was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @users_songs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_songs/1
  # DELETE /users_songs/1.xml
  def destroy
    @users_songs = UsersSongs.find(params[:id])
    @users_songs.destroy

    respond_to do |format|
      format.html { redirect_to(users_songs_url) }
      format.xml  { head :ok }
    end
  end
end
