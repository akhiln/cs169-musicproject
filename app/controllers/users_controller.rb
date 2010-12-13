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
    respond_to do |format|
    if success
         format.html { redirect_to(:root) } 
         format.xml  { render :xml => @user, :status => :created, :location => @user }
         format.js do
           responds_to_parent do
             render :update do |page|
              page.hide "new_user_form"
              page.insert_html :bottom, :main_content, :partial => 'users/welcome'
              page.replace_html "login_links", :partial => 'index/login_links'
              page.replace_html "nav", :partial => 'index/nav'
             end
           end
         end
    else
         format.html { render :action => :new }
         format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
         format.js do
           responds_to_parent do
             render :update do |page|
                page.replace_html :bottom, :new_user_form, :partial => 'users/form'
              end
           end
        end
    end
   end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    success = @user.save
    respond_to do |format|
      if success
        flash[:notice] = 'Your information was successfully updated.'
        format.html { redirect_to @user}
        format.xml  { head :ok }
        format.js do
           responds_to_parent do
             render :update do |page|
               page.replace_html "main_content", :partial => 'users/show'
             end
           end
         end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js do
           responds_to_parent do
             render :update do |page|
                flash[:errors] = "Your information could not be saved"
              end
           end
        end
      end
    end
  end
  
  def subscribers
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
  end

  def show
    params[:id] ||= current_user.id
    @user = User.find(params[:id])
    @songs = @user.songs
    @bookmarks = @user.bookmarks
    #@followed = @user.followed
    
    if  !@songs.nil? && @songs.length > 10
      @songs = @songs[0..9]
    end
    @playlists = @user.playlists
    if (not @playlists.nil?) && @playlists.length > 10
      @playlists = @playlists[0..9]
    end
  end

end
