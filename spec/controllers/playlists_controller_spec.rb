require 'spec_helper'

describe PlaylistsController, "Make a new playlist" do
  before(:each) do
    auth_login
    Playlist.stub!(:new).and_return(@playlist = mock_model(Playlist, :save=>true))
    assigns[:current_user] = mock_model(User, :id=>0)
    User.stub!(:id).and_return(0)
  end
  
  def do_create
    assigns[:current_user] = mock_model(User, :id=>0)
    post :create, :playlist=>{:id=>0}
  end
  
  it "should create the playlist" do
    Playlist.should_receive(:new).with("id"=>0).and_return(@playlist)
    @playlist.should_receive(:user_id=).with(1)
    do_create
  end
  
  it "should save the playlist" do
    @playlist.should_receive(:save).and_return(true)
    @playlist.should_receive(:user_id=).with(1)
    do_create
  end
  
  it "should be redirect" do
    @playlist.should_receive(:user_id=).with(1)
    do_create
    response.should be_redirect
  end
end

describe PlaylistsController, "List all playlists for a user" do
  before(:each) do
    auth_login
    Playlist.stub!(:new).and_return(@playlist = mock_model(Playlist, :save=>true))
    User.stub!(:find).and_return(mock_model(User, :playlists=>[@playlist]))
  end
  
  it "should get all playlists for the user" do
    get :list, :playlist=>{:id=>0}
    assigns(:playlists).should == [@playlist]
  end
end

describe PlaylistsController, "List all songs in a playlist" do
  before(:each) do
    auth_login
    @mock_song = mock_model(Song)
    @playlist = mock_model(Playlist, :songs=>[@mock_song], :playlist_comments=>[])
    Playlist.stub!(:find).and_return(@playlist)
  end
  
  it "should get all songs for the playlist" do
    get :show, :playlist=>{:id=>0}
    assigns(:playlist).should == @playlist
    assigns(:songs).should == [@mock_song]
  end
end

describe PlaylistsController, "Make new playlist" do
  before(:each) do
    auth_login
    @playlist = mock_model(Playlist)
    Playlist.stub!(:new).and_return(@playlist)
  end
  
  it "should make a new list" do
    get :new
    assigns(:playlist).should == @playlist
  end
end

describe PlaylistsController, "Delete a playlist" do
  before(:each) do
    auth_login
    @playlist = mock_model(Playlist)
    Playlist.stub!(:find).and_return(@playlist)
  end
  
  it "should call destroy" do
    @playlist.should_receive(:destroy).and_return(true)
    get :delete, :playlist=>{:id=>0}
  end
  
  it "should redirect" do
    @playlist.stub!(:destroy).and_return(true)
    get :delete, :playlist=>{:id=>0}
    response.should be_redirect
  end
end

describe PlaylistsController, "Add song to playlist" do
  before(:each) do
    auth_login
    @mock_playlist = mock_model(Playlist)
    @myUser.stub!(:playlists).and_return([@mock_playlist])
    @song = mock_model(Song)
    Song.stub!(:find).and_return(@song)
  end
  
  it "should find all possible lists" do
    get :addsong, :song_id=>42
    assigns(:song_id).should == "42"
    assigns(:song).should == @song
    assigns(:playlists).should == [@mock_playlist]
  end
  
  it "should create a new PlaylistSong" do
    Playlistsong.stub!(:new).and_return(@plsong = mock_model(Playlistsong, {:playlist_id= =>0, :song_id= =>0, :save => true}))
    Playlist.stub!(:find).and_return(mock_model(Playlist))
    post :confirmaddsong, {:song_id=>0,:playlist=>0}
    response.should be_redirect
  end
end

describe PlaylistsController, "Find popular playlists" do
  before(:each) do
    auth_login
    @mock_playlist = mock_model(Playlist)
    @mock_playlist.stub!(:rating).and_return(3.0)
    Playlist.stub!(:find).and_return([@mock_playlist])
  end
  
  it "should include popular playlists" do
    get :popular
    assigns(:playlists).should == [@mock_playlist]
  end
end

describe PlaylistsController, "Find playlists owned by the current user" do
  before(:each) do
    auth_login
    @mock_playlist = mock_model(Playlist)
    @myUser.stub!(:playlists).and_return([@mock_playlist])
  end
  
  it "should include playlists owned by the user" do
    get :my
    assigns(:playlists).should == [@mock_playlist]
  end
end