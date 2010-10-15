require 'spec_helper'

describe "/songs/index.html.erb" do
  include SongsHelper

  before(:each) do
    assigns[:songs] = [
      stub_model(Song,
        :source => "value for source",
        :album => "value for album",
        :length => 1.5,
        :genre => "value for genre",
        :description => "value for description",
        :rating => 1.5
      ),
      stub_model(Song,
        :source => "value for source",
        :album => "value for album",
        :length => 1.5,
        :genre => "value for genre",
        :description => "value for description",
        :rating => 1.5
      )
    ]
  end

  it "renders a list of songs" do
    render
    response.should have_tag("tr>td", "value for source".to_s, 2)
    response.should have_tag("tr>td", "value for album".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", "value for genre".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
end
