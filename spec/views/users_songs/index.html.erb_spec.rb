require 'spec_helper'

describe "/users_songs/index.html.erb" do
  include UsersSongsHelper

  before(:each) do
    assigns[:users_songs] = [
      stub_model(UsersSongs,
        :user_id => 1,
        :song_id => 1
      ),
      stub_model(UsersSongs,
        :user_id => 1,
        :song_id => 1
      )
    ]
  end

  it "renders a list of users_songs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
