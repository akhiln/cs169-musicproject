When /^I visit Make a new playlist$/ do
  visit path_to('the Make new playlist page')
end

When /^I name it "([^"]*)"$/ do |song|
  fill_in('Name', :with=>song)
  click_button('Create')
end

When /^I add the song "([^"]*)" to "([^"]*)"$/ do |song, playlist|
  
end
