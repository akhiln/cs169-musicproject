require 'spec_helper'

describe "/playlists/index.html.erb" do
  include PlaylistsHelper

  before(:each) do
    assigns[:playlists] = [
      stub_model(Playlist,
        :name => "value for name",
        :user_id => 1,
        :rating => 1.5,
        :description => "value for description"
      ),
      stub_model(Playlist,
        :name => "value for name",
        :user_id => 1,
        :rating => 1.5,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of playlists" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
