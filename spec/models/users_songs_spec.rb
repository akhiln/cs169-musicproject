require 'spec_helper'

describe UsersSongs do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :song_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    UsersSongs.create!(@valid_attributes)
  end
end
