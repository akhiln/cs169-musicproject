require 'spec_helper'

describe "/genres/show.html.erb" do
  include GenresHelper
  before(:each) do
    assigns[:genre] = @genre = stub_model(Genre,
      :genre_name => "value for genre_name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ genre_name/)
  end
end
