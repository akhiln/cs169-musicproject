require 'spec_helper'

describe "/genres/edit.html.erb" do
  include GenresHelper

  before(:each) do
    assigns[:genre] = @genre = stub_model(Genre,
      :new_record? => false,
      :genre_name => "value for genre_name"
    )
  end

  it "renders the edit genre form" do
    render

    response.should have_tag("form[action=#{genre_path(@genre)}][method=post]") do
      with_tag('input#genre_genre_name[name=?]', "genre[genre_name]")
    end
  end
end
