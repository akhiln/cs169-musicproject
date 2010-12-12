require 'spec_helper'

describe Song, "make a player" do
  before(:each) do
    auth_login
    @song = Song.new
    @song.should_receive(:name).exactly(2).times.and_return("Zippy")
    @song_song = mock()
    @song_song.stub(:url).exactly(2).times.and_return("someplace.com")
    @song.should_receive(:song).exactly(2).times.and_return(@song_song)
  end
  
  it "should return and empty string, because it doesn't do anything anymore" do
    @song.makePlayer.should == "<a href=\"#\" onclick=\"playListAdd('Zippy', 'someplace.com')\"><img src=\"/images/add_button.jpeg\" width=23 height=23 ></a>\n\t<a href=\"#\" onclick=\"playListAddAndPlay('Zippy', 'someplace.com')\"><img src=\"/images/play.png \" ></a>"
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

