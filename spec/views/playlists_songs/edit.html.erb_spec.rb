require 'spec_helper'

describe "/playlists_songs/edit.html.erb" do
  include PlaylistsSongsHelper

  before(:each) do
    assigns[:playlists_songs] = @playlists_songs = stub_model(PlaylistsSongs,
      :new_record? => false,
      :playlist_id => 1,
      :song_id => 1
    )
  end

  it "renders the edit playlists_songs form" do
    render

    response.should have_tag("form[action=#{playlists_songs_path(@playlists_songs)}][method=post]") do
      with_tag('input#playlists_songs_playlist_id[name=?]', "playlists_songs[playlist_id]")
      with_tag('input#playlists_songs_song_id[name=?]', "playlists_songs[song_id]")
    end
  end
end
