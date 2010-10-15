require 'spec_helper'

describe Song do
  before(:each) do
    @valid_attributes = {
      :source => "value for source",
      :album => "value for album",
      :length => 1.5,
      :genre => "value for genre",
      :description => "value for description",
      :rating => 1.5
    }
  end

  it "should create a new instance given valid attributes" do
    Song.create!(@valid_attributes)
  end
end
