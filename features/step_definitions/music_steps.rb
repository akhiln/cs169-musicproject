
When /^I upload the song "([^"]*)"$/ do |arg1|
  attach_file("upload_datafile", File.join(RAILS_ROOT, 'features', 'upload_files', arg1))
end

Then /^there should be a player on the page$/ do
  if page.respond_to? :should
    page.should have_selector("object", :type => "application/x-shockwave-flash")
  else
    assert page.has_selector?("object", :type => "application/x-shockwave-flash")
  end
end