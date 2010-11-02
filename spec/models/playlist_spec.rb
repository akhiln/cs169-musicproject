require 'spec_helper'

describe Playlist do
	
	describe "When creating a valid playlist" do
		it "a name and user id is required" do
			Playlist.create.valid?.should == false
		end
	end
end