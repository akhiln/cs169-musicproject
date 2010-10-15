require 'spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :name => "value for name",
        :pic => "value for pic",
        :bio => "value for bio",
        :email => "value for email"
      ),
      stub_model(User,
        :name => "value for name",
        :pic => "value for pic",
        :bio => "value for bio",
        :email => "value for email"
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for pic".to_s, 2)
    response.should have_tag("tr>td", "value for bio".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
  end
end
