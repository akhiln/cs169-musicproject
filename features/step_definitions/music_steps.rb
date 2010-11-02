
When /^I upload the file "([^"]*)"$/ do |arg1|
  attach_file(:upload, File.join(RAILS_ROOT, 'features', 'upload_files', arg1))
end