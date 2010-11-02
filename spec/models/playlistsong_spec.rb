require 'spec_helper'

describe Playlistsong do
	
	describe "When creating a valid playlist song" do
		it "a playlist id and song id is required" do
			Playlistsong.create.valid?.should == false
		end
	end
end