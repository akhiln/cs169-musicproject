require 'spec_helper'

describe "/users_songs/show.html.erb" do
  include UsersSongsHelper
  before(:each) do
    assigns[:users_songs] = @users_songs = stub_model(UsersSongs,
      :user_id => 1,
      :song_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
