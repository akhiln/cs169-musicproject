require 'spec_helper'

describe "/playlists_songs/index.html.erb" do
  include PlaylistsSongsHelper

  before(:each) do
    assigns[:playlists_songs] = [
      stub_model(PlaylistsSongs,
        :playlist_id => 1,
        :song_id => 1
      ),
      stub_model(PlaylistsSongs,
        :playlist_id => 1,
        :song_id => 1
      )
    ]
  end

  it "renders a list of playlists_songs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
