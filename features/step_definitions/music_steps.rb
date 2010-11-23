
When /^I upload the song "([^"]*)"$/ do |arg1|
  attach_file("song_song", File.join(RAILS_ROOT, 'features', 'upload_files', arg1))
end

Given /^"([^"]*)" has uploaded a song with name "([^"]*)", album "([^"]*)", genre "([^"]*)", and description "([^"]*)"$/ do |login, name, album, genre, description|
  @user = User.find_by_name login
  params = {:name=>name, :album=>album, :genre=>genre, :description=>description}
  @user.songs.build(params)
  @user.save  
end

Given /^I am editing the song "([^"]*)"$/ do |arg1|
  @song = Song.find_by_name arg1
  visit("/songs/edit/" + @song.id.to_s)
end

Then /^the database should contain a song named "([^"]*)"$/ do |arg1|
  @song = Song.find_by_name arg1
  @song.should_not == nil
end

Then /^the database should not contain a song named "([^"]*)"$/ do |arg1|
  @song = Song.find_by_name arg1
  @song.should == nil
end