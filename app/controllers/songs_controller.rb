class SongsController < ApplicationController
  # POST /songs
  # POST /songs.xml
  #before_filter :require_user

  def create
     @song = Song.new(params[:song])
     respond_to do |format|     
       if @song.save       
        @users_songs = Usersong.new({:user_id => current_user.id, :song_id => @song.id})
        if @users_songs.save
          @action = Action.new :user_id =>current_user.id, :action =>"create", :obj_type =>"song", :obj_id =>@song.id
          @action.save
         format.html { redirect_to(:root) } 
         format.xml  { render :xml => @song, :status => :created, :location => @song }
         format.js do
           responds_to_parent do
             render :update do |page|
              page.hide "upload_form"
              page.insert_html :bottom, :main_content, :partial => 'songs/edit'
             end
           end
         end
        else
         format.html { render :action => :new }
         format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
         format.js do
           responds_to_parent do
             render :update do |page|
                page.replace_html :bottom, :song_form, :partial => 'songs/form'
              end
           end
         end
       end
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
  
  def show
    @song = Song.find(params[:id])
    @comments = @song.song_comments
    if @song.users.include?(current_user)
      @auth = true
    else
      @auth = false
    end
	@urlif = 'http://project-jukebox.heroku.com/index?url=/songs/' + @song.id.to_s
	@urlif << '%26title='
	@urlif << @song.name
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
    actions = Action.find(:all, :conditions => {"obj_id" => @song.id.to_s, "obj_type" =>"song"})
    actions.each {|act| act.destroy}
    pl_songs = Playlistsong.find(:all, :conditions => {"song_id" => @song.id.to_s})
    pl_songs.each {|pl_s| pl_s.destroy}
    @song.destroy
    redirect_to(current_user, :notice => "Song successfully deleted")
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
    #grab the first 20 random songs
    @songs = @songs[0..[@songs.size-1,20].min]
    #order by rating
    @songs.sort! {|b,a| (a.rating.nil? ? 0.0 : a.rating.to_d) <=> (b.rating.nil? ? 0.0 : b.rating.to_d) }
  end
  
end
