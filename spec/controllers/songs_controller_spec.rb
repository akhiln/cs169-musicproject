require 'spec_helper'

describe SongsController, "Make a new song" do
  before(:each) do
    auth_login
    Song.stub!(:new).and_return(@song = mock_model(Song, {:save=>true, :upload=>true}))
    assigns[:current_user] = mock_model(User, :id=>0)
    User.stub!(:id).and_return(0)
  end
  
  def do_create
    assigns[:current_user] = mock_model(User, :id=>0)
    post :create, :song=>{:id=>0}
  end
  
  it "should create the playlist" do
    Song.should_receive(:new).with(any_args()).and_return(@song)
    do_create
  end
  
  it "should save the playlist" do
    @song.should_receive(:save).with(any_args()).and_return(true)
    do_create
  end
  
  it "should be redirect" do
    Song.should_receive(:new).with(any_args()).and_return(@song)
    do_create
    response.should be_redirect
  end
  
  it "should render new if it fails" do
    Usersong.stub!(:new).and_return(mock_model(Usersong, {:save=>false}))
    do_create
    response.should render_template("new")
  end
  
  it "should render new from the new action" do
    get :new
    response.should render_template("new")
  end
end

describe SongsController, "Show a song" do
  before(:each) do
    auth_login
    Song.stub!(:find).and_return(@song = mock_model(Song).as_null_object)
  end
  
  it "should render show" do
    @song.stub!(:users).and_return([])
    get :show, :song=>{:id=>0}
    response.should render_template("show")
  end
  
  it "should set auth when owned by the current user" do
    @song.expect(:users).and_return([@myUser])
    get :show, :song=>{:id=>0}
    assigns(:auth).should == true
  end
  
  it "should not set auth when not owned by the current user" do
    @song.expect(:users).and_return([])
    get :show, :song=>{:id=>0}
    assigns(:auth).should == true
  end
end

describe SongsController, "Edit a song" do
  before(:each) do
    auth_login
  end
  
  it "should render the edit page with @song set appropriately" do
    Song.stub!(:find).and_return(@song = mock_model(Song))
    get :edit, :song=>{:id=>3}
    assigns(:song).should == @song
    response.should render_template("edit")
  end
  
  it "should redirect to the song's page on a good update" do
    Song.stub!(:find).and_return(@song = mock_model(Song, {:update_attributes=>true}))
    post :update, :song=>{:id=>3}
    response.should be_redirect
  end
  
  it "should send you back to edit on a bad update" do
    Song.stub!(:find).and_return(@song = mock_model(Song, {:update_attributes=>false}))
    post :update, :song=>{:id=>3}
    response.should render_template("edit")
  end
end

describe SongsController, "View index of all songs" do
  before(:each) do
    auth_login
  end
  
  it "should pass on the list of all songs" do
    @song_list = [mock_model(Song),mock_model(Song),mock_model(Song)]
    Song.stub!(:find).and_return(@song_list)
    get :index
    assigns(:Songs).should == @song_list
    response.should render_template("index")
  end
  
  
  it "should pass an empty list if it gets nil" do
    Song.stub!(:find).and_return(nil)
    get :index
    assigns(:Songs).should == []
    response.should render_template("index")
  end
end

describe SongsController, "Delete a song" do
  before(:each) do
    auth_login
    Song.stub!(:find).and_return(@song = mock_model(Song))
    @song.should_receive(:destroy)
  end
  
  it "should redirect after being destroyed" do
    delete :delete
    response.should be_redirect
  end
end

describe SongsController, "Display my songs" do
  before(:each) do
    auth_login
    @mySongs = [mock_model(Song), mock_model(Song)]
    otherSong = mock_model(Song)
    @myUser.should_receive(:songs).and_return(@mySongs)
  end
  
  it "should return my songs" do
    get :my
    assigns(:songs).should == @mySongs
    response.should render_template("my")
  end
end

describe SongsController, "Display popular songs" do
  before(:each) do
    auth_login
    @mySongs = [mock_model(Song), mock_model(Song)]
    otherSong = mock_model(Song)
    Song.stub!(:find).and_return(@mySongs)
  end
  
  it "should return the most popular songs" do
    get :popular
    assigns(:songs).should == @mySongs
    response.should render_template("popular")
  end
end