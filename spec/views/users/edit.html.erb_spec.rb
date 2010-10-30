require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :name => "value for name",
      :pic => "value for pic",
      :bio => "value for bio",
      :email => "value for email"
    )
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_name[name=?]', "user[name]")
      with_tag('input#user_pic[name=?]', "user[pic]")
      with_tag('input#user_bio[name=?]', "user[bio]")
      with_tag('input#user_email[name=?]', "user[email]")
    end
  end
end
