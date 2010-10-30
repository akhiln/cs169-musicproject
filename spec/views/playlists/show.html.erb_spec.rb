require 'spec_helper'

describe "/playlists/show.html.erb" do
  include PlaylistsHelper
  before(:each) do
    assigns[:playlist] = @playlist = stub_model(Playlist,
      :name => "value for name",
      :user_id => 1,
      :rating => 1.5,
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1\.5/)
    response.should have_text(/value\ for\ description/)
  end
end
