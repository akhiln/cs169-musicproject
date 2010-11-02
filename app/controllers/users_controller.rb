class UsersController < ApplicationController
  
  # render new.rhtml
  def new
    @user = User.new
    render :action => 'new'
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    
    success = @user && @user.save
    if success && @user.errors.empty?
      # save the profile picture:
        if not params[:upload].empty?
          @user.upload_picture(params[:upload])
        else
          @user.pic = "/images/default.jpg"
          @user.save
        end
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_to @user
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if not @current_user.id == @user.id
       flash[:error]  = "You do not have permission to edit this user."
       render :action => "show"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    success = @user.save
    if not params[:upload].nil?
      success = success && @user.upload_picture(params[:upload])
    end
    respond_to do |format|
      if success
        flash[:notice] = 'Your information was successfully updated.'
        format.html { redirect_to @user}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
    @user = User.find(params[:id])
    @songs = @user.songs
    if  !@songs.nil? && @songs.length > 10
      @songs = @songs[0..9]
    end
    @playlists = @user.playlists
    if (not @playlists.nil?) && @playlists.length > 10
      @playlists = @playlists[0..9]
    end
  end

end
