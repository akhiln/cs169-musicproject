require 'spec_helper'

describe "/songs/show.html.erb" do
  include SongsHelper
  before(:each) do
    assigns[:song] = @song = stub_model(Song,
      :source => "value for source",
      :album => "value for album",
      :length => 1.5,
      :genre => "value for genre",
      :description => "value for description",
      :rating => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ source/)
    response.should have_text(/value\ for\ album/)
    response.should have_text(/1\.5/)
    response.should have_text(/value\ for\ genre/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1\.5/)
  end
end
