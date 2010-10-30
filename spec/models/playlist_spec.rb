require 'spec_helper'

describe Playlist do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :user_id => 1,
      :rating => 1.5,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Playlist.create!(@valid_attributes)
  end
end
