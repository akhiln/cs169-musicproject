Given /^"([^"]*)" has created a song named "([^"]*)", with genre "([^"]*)"$/ do |user_name, song_name, song_genre|
  @user = User.find_by_name user_name
  @genre = Genre.new({:genre_name=>song_genre})
  @genre.save!
  @song = @user.songs.build({:name=>song_name, :genre_id=>@genre.id})
  @user.save!
end


Given /^there is a genre named "([^"]*)"$/ do |genre|
  @genre = Genre.new({:genre_name=>genre})
  @genre.save!
end
