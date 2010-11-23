Given /^"([^"]*)" has given the song "([^"]*)" a rating of "([^"]*)"$/ do |user_name, song_name, rating|
  @user = User.find_by_name user_name
  @song = Song.find_by_name song_name
  rating = rating.to_i
  @sr = SongRating.new
  @sr.user_id = @user.id
  @sr.song_id = @song.id
  @sr.rating = rating
  @sr.save
end