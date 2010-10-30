require 'spec_helper'

describe "/playlists_songs/show.html.erb" do
  include PlaylistsSongsHelper
  before(:each) do
    assigns[:playlists_songs] = @playlists_songs = stub_model(PlaylistsSongs,
      :playlist_id => 1,
      :song_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
