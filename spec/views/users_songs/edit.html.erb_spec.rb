require 'spec_helper'

describe "/users_songs/edit.html.erb" do
  include UsersSongsHelper

  before(:each) do
    assigns[:users_songs] = @users_songs = stub_model(UsersSongs,
      :new_record? => false,
      :user_id => 1,
      :song_id => 1
    )
  end

  it "renders the edit users_songs form" do
    render

    response.should have_tag("form[action=#{users_songs_path(@users_songs)}][method=post]") do
      with_tag('input#users_songs_user_id[name=?]', "users_songs[user_id]")
      with_tag('input#users_songs_song_id[name=?]', "users_songs[song_id]")
    end
  end
end
