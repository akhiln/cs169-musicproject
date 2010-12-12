require 'spec_helper'

describe UsersController, "Make a new user" do
  before(:each) do
    @user = mock_model(User, {:save=>true})
    User.stub!(:new).and_return(@user)
  end
  
  
  it "should render the new page" do
    get :new
    response.should render_template("new")
  end
  
  it "should redirect to root on successful creation" do
    post :create
    response.should be_redirect
  end
  
  it "should render new on unsuccessful creation" do
    @user.stub!(:save).and_return(false)
    post :create
    response.should render_template("new")
  end
  
  it "should render the welcome partial on unsuccessful js creation" do
    @user.stub!(:save).and_return(false)
    post :create, :format=>'js'
  end
  
  it "should render the form partial on successful js creation" do
    post :create, :format=>'js'
    response.should render_template('users/_welcome.html.erb')
  end
end

describe UsersController, "Render the edit page" do
  it "should render the edit page" do
    auth_login
    get :edit
    response.should render_template('edit')
  end
end

describe UsersController, "Edit an existing user" do
  before(:each) do
    auth_login
    @user = User.new
    @user.stub!({:save=>true, :update_attributes=>true, :name=>'', :photo=>mock('photo', {:url=>''})})
    User.should_receive(:find).with("4").and_return(@user)
  end
  
  it "should redirect to user's page on successful editing" do
    post :update, :id=>4
    response.should be_redirect
  end
  
  it "should render edit on unsuccessful editing" do
    @user.stub!(:save).and_return(false)
    post :update, :id=>4
    response.should render_template("edit")
  end
  
  it "should render the welcome partial on successful js creation" do
    post :update, :id=>4, :format=>'js'
    response.should render_template('users/_show.html.erb')
  end
  
  it "should render the form partial on unsuccessful js creation" do
    @user.stub!(:save).and_return(false)
    post :update, :id=>4, :format=>'js'
  end
end

describe UsersController, "View an existing user" do
  before(:each) do
    auth_login
    @user = User.new
    @user.stub!({:save=>true, :update_attributes=>true, :name=>'', :photo=>mock('photo', {:url=>''})})
  end
  
  it "should show the current user if no id is given" do
    User.should_receive(:find).with(@myUser.id).and_return(@myUser)
    @myUser.should_receive(:songs).and_return([])
    @myUser.should_receive(:playlists).and_return([])
    post :show
    response.should render_template('show')
  end
  
  it "should show the user with the given id" do
    User.should_receive(:find).with("4").and_return(@user)
    @user.should_receive(:songs).and_return(nil)
    @user.should_receive(:playlists).and_return(nil)
    post :show, :id=>4
    response.should render_template('show')
  end
  
  it "should trim the songs list down to 10" do
    @songs = [Song.new, Song.new, Song.new, Song.new, Song.new, Song.new, Song.new, Song.new, Song.new, Song.new, Song.new]
    User.should_receive(:find).with("4").and_return(@user)
    @user.should_receive(:songs).and_return(@songs)
    @user.should_receive(:playlists).and_return(nil)
    post :show, :id=>4
    response.should render_template('show')
    assigns[:songs].should == @songs[0..9]
  end
  
  it "should trim the playlist list down to 10" do
    @playlists = [Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new, Playlist.new]
    User.should_receive(:find).with("4").and_return(@user)
    @user.should_receive(:songs).and_return(nil)
    @user.should_receive(:playlists).and_return(@playlists)
    post :show, :id=>4
    response.should render_template('show')
    assigns[:playlists].should == @playlists[0..9]
  end
end