require 'spec_helper'

describe Playlist do
	
	describe "When creating a valid playlist" do
		it "a name and user id is required" do
			Playlist.create.valid?.should == false
		end
	end
  
  it "should generate buttons to add the playlist to Now Playing" do
    @playlist = Playlist.new
    @playlist.stub!(:songs).and_return([mock_model(Song, {:name=>"LaLaLa", :song=>mock('song', {:url=>"middleofnowhere.com"})})])
    @playlist.renderRow.should == "<a href=\"#\" onclick=\"playListAdd('LaLaLa','middleofnowhere.com');  playListChange(myPlayList.length-1);\"><img src=\"/images/play.png\"></a>\n\t<a href=\"#\" onclick=\"playListAdd('LaLaLa','middleofnowhere.com'); \"><img src=\"/images/add_button.jpeg\" width=23 height=23></a>"
  end
  
  describe "When displaying the rating" do
  
    it "should give \"-\" for nil ratings" do
      @playlist = Playlist.new
      @playlist.stub!(:rating).and_return(nil)
      @playlist.ratingString.should == "-"
    end
    
    it "should display ratings with 2 digits past the decimal" do
      @playlist = Playlist.new
      @playlist.stub!(:rating).and_return(4.0/3.0)
      @playlist.ratingString.should == "1.33"
    end
  end
  
  describe "When recalculating ratings" do
    it "should store nil when there are no ratings" do
      @playlist = Playlist.new
      @playlist.stub!(:playlist_ratings).and_return([])
      @playlist.should_receive(:rating=).with(nil)
      @playlist.updateRating
    end
    
    it "should properly calculate ratings" do
      @playlist = Playlist.new
      @playlist_ratings = [mock('pr1', {:rating=>5}), mock('pr2', {:rating=>4})]
      @playlist.stub!(:playlist_ratings).and_return(@playlist_ratings)
      @playlist.should_receive(:rating=).with(4.5)
      @playlist.updateRating
    end
  end
end