
Given /^I am not signed in$/ do 
  visit '/logout'
end

Given /^there is a profile named "(.*)" with password "(.*)$/ do |user_name, password|
   @user = User.new  :name => user_name, :bio => "information!", :email => "asdfkj@asdfkkj.com",
                :password => password, :login => user_name, :pic => "/images/default.jpg"
   @user.save
end

Given /^I am signed in as "(.*) with password "(.*)"$/ do |user_name, password|
   @user = User.find_by_name(user_name)
   log_in_user!  :login => user_name, :password => password
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


