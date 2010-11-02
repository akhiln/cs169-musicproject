
Given /^I am not signed in$/ do 
  visit '/logout'
end

Given /^there is a profile named "([^"]*)"$/ do |user_name|
   @user = User.new  :name => user_name, :bio => "information!", :email => "asdfkj@asdfkkj.com",
                :password => "password", :password_confirmation => "password",
                :login => user_name, :pic => "/images/default.jpg"
   @user.save!
end

Given /^I am signed in as "([^"]*)"$/ do |user_name|
   @user = User.find_by_name(user_name)
   log_in_user!  :login => user_name, :password => "password"
end

Given /^I sign in as "(.*)" using password (".*)$/ do |login, passwd|
   visit path_to('the login page')
   fill_in('Login', :with => user_name)
   fill_in('Password', :with => password)
   click_button('Log in')
     current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given /^"(.)" has uploaded a song called "(.)"$/ do |user, song|
  @user = User.find_by_name(user)
  @user.songs << Song.new(:name => song)
  @user.save
end

Then /^there should be a user named "(.*)"$/ do |user_name|
  @user = User.find_by_name(user_name)
  @user.should be_valid
end

Then /^the picture of "(.*)" is default$/ do |user_name|
  @user = User.find_by_name(user_name)
  assert @user.pic == "/images/default.jpg"
end


