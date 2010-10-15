require 'spec_helper'

describe "/songs/edit.html.erb" do
  include SongsHelper

  before(:each) do
    assigns[:song] = @song = stub_model(Song,
      :new_record? => false,
      :source => "value for source",
      :album => "value for album",
      :length => 1.5,
      :genre => "value for genre",
      :description => "value for description",
      :rating => 1.5
    )
  end

  it "renders the edit song form" do
    render

    response.should have_tag("form[action=#{song_path(@song)}][method=post]") do
      with_tag('input#song_source[name=?]', "song[source]")
      with_tag('input#song_album[name=?]', "song[album]")
      with_tag('input#song_length[name=?]', "song[length]")
      with_tag('input#song_genre[name=?]', "song[genre]")
      with_tag('textarea#song_description[name=?]', "song[description]")
      with_tag('input#song_rating[name=?]', "song[rating]")
    end
  end
end
