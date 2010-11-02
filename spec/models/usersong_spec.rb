require 'spec_helper'

describe Usersong do
	
	describe "When creating a valid user song" do
		it "a song id and user id is required" do
			Usersong.create.valid?.should == false
		end
	end
end
