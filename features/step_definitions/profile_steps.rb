
Given /^I am not signed in$/ do 
  visit '/logout'
end

Then /^there should be a user named "(.*)"$/ do |user_name|
  @user = User.find_by_name(user_name)
  @user.should be_valid
end


