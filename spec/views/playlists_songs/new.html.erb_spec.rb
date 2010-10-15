require 'spec_helper'

describe "/playlists_songs/new.html.erb" do
  include PlaylistsSongsHelper

  before(:each) do
    assigns[:playlists_songs] = stub_model(PlaylistsSongs,
      :new_record? => true,
      :playlist_id => 1,
      :song_id => 1
    )
  end

  it "renders new playlists_songs form" do
    render

    response.should have_tag("form[action=?][method=post]", playlists_songs_path) do
      with_tag("input#playlists_songs_playlist_id[name=?]", "playlists_songs[playlist_id]")
      with_tag("input#playlists_songs_song_id[name=?]", "playlists_songs[song_id]")
    end
  end
end
