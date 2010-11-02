require 'spec_helper'

describe SongsController, "Make a new playlist" do
  before(:each) do
    Song.stub!(:new).and_return(@song = mock_model(Song, {:save=>true, :upload=>true}))
	assigns[:current_user] = mock_model(User, :id=>0)
	User.stub!(:id).and_return(0)
	login_as(:admin)
  end
  
  def do_create
	assigns[:current_user] = mock_model(User, :id=>0)
    post :create, :song=>{:id=>0}
  end
  
  it "should create the playlist" do
    #Song.should_receive(:new).with(any_args()).and_return(@song)
    do_create
  end
  
  it "should save the playlist" do
    #@song.should_receive(:save).with(any_args()).and_return(true)
    do_create
  end
  
  it "should be redirect" do
    do_create
    response.should be_redirect
  end
end
  

