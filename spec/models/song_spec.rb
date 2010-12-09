require 'spec_helper'

describe Song, "upload a new song" do
  before(:each) do
    auth_login
    @song = Song.new
    @song.stub!(:save).and_return(true)
    @song.stub!(:id).and_return(42)
    @uploadFile = {}
    @uploadFile['datafile'] = mock()
  end
  
  it "should save a valid file into public/songs/:id" do
    @uploadFile['datafile'].should_receive(:original_filename).and_return("foobar.mp3")
    File.should_receive(:open).with("public/songs/42.mp3", "wb")
    @song.upload(@uploadFile).should == true
  end
  
  it "should return false if uploadFile is nil" do
    @song.upload(nil).should == false
  end
  
  it "should return false if there is no data in the argument" do
    @song.upload({'datafile'=>nil}).should == false
    @song.upload({'datafile'=>""}).should == false
  end
  
  it "should return false if the filename does not end in .mp3" do
    @uploadFile['datafile'].should_receive(:original_filename).and_return("fubar.mp9")
    @song.upload(@uploadFile).should == false
  end
end

describe Song, "generate an Ajax link to the song's show page" do
  before(:each) do
    auth_login
    @song = Song.new
    @song.should_receive(:name).and_return("Zippy")
    @song.should_receive(:id).and_return(24)
    @song.should_receive(:link_to_remote).with("Zippy", {:url=>'/songs/show/24', :update=>'main_content'}).and_return("Ooga")
  end
  
  it "should return an HTML/JS tag to make an Ajax call" do
    @song.renderRow.should == "Ooga"
  end
end

describe Song, "generate a string representation of the song's rating" do
  before(:each) do
    auth_login
    @song = Song.new
    @song.stub!(:save).and_return(true)
  end
  
  it "should round past the 2nd decimal place" do
    @song.stub!(:rating).and_return(3.2591234324)
    @song.ratingString.should == "3.26"
  end
  
  it "should print - for unrated songs" do
    @song.should_receive(:rating).and_return(nil)
    @song.ratingString.should == "-"
  end
  
  it "should average ratings when recalculating" do
    @song.should_receive(:song_ratings).and_return([mock_model(SongRating, {:rating=>3.0}), mock_model(SongRating, {:rating=>5.0})])
    @song.updateRating
    @song.rating.should == 4.0
  end
  
  it "should set rating to nil if there aren't any ratings" do
    @song.should_receive(:song_ratings).and_return([])
    @song.updateRating
    @song.rating.should == nil
  end
end

