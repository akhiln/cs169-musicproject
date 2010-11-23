
Given /^"([^"]*)" has created a song with name "([^"]*)", and description "([^"]*)"$/ do |user_name, song_name, song_desc|
  @user = User.find_by_name user_name
  @user.songs.build({:name=>song_name, :description=>song_desc})
  @user.save
end
