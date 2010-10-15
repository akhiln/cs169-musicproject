require 'spec_helper'

describe "/users_songs/new.html.erb" do
  include UsersSongsHelper

  before(:each) do
    assigns[:users_songs] = stub_model(UsersSongs,
      :new_record? => true,
      :user_id => 1,
      :song_id => 1
    )
  end

  it "renders new users_songs form" do
    render

    response.should have_tag("form[action=?][method=post]", users_songs_path) do
      with_tag("input#users_songs_user_id[name=?]", "users_songs[user_id]")
      with_tag("input#users_songs_song_id[name=?]", "users_songs[song_id]")
    end
  end
end
