require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :name => "value for name",
      :pic => "value for pic",
      :bio => "value for bio",
      :email => "value for email"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ pic/)
    response.should have_text(/value\ for\ bio/)
    response.should have_text(/value\ for\ email/)
  end
end
