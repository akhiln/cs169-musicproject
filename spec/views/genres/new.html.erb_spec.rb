require 'spec_helper'

describe "/genres/new.html.erb" do
  include GenresHelper

  before(:each) do
    assigns[:genre] = stub_model(Genre,
      :new_record? => true,
      :genre_name => "value for genre_name"
    )
  end

  it "renders new genre form" do
    render

    response.should have_tag("form[action=?][method=post]", genres_path) do
      with_tag("input#genre_genre_name[name=?]", "genre[genre_name]")
    end
  end
end
