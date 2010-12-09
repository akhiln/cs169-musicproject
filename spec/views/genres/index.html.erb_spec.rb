require 'spec_helper'

describe "/genres/index.html.erb" do
  include GenresHelper

  before(:each) do
    assigns[:genres] = [
      stub_model(Genre,
        :genre_name => "value for genre_name"
      ),
      stub_model(Genre,
        :genre_name => "value for genre_name"
      )
    ]
  end

  it "renders a list of genres" do
    render
    response.should have_tag("tr>td", "value for genre_name".to_s, 2)
  end
end
