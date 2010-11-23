Given /^"([^"]*)" has created a song named "([^"]*)", with genre "([^"]*)"$/ do |user_name, song_name, song_genre|
  @user = User.find_by_name user_name
  @user.songs.build({:name=>song_name, :genre=>song_genre})
  @user.save
end
