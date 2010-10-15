require 'spec_helper'

describe PlaylistsSongs do
  before(:each) do
    @valid_attributes = {
      :playlist_id => 1,
      :song_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    PlaylistsSongs.create!(@valid_attributes)
  end
end
