class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  # render new.rhtml
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    success = @user.save
    if success && @user.errors.empty?
      # save the profile picture:
          @user.upload_picture(params[:upload])
      redirect_to '/Users/show/'+@user.id.to_s
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
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
    params[:id] ||= @current_user.id
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
