
Given /^"([^"]*)" has created a playlist with name "([^"]*)", and description "([^"]*)"$/ do |user_name, pl_name, pl_desc|
  @user = User.find_by_name user_name
  @user.playlists.build({:name=>pl_name, :description=>pl_desc})
  @user.save
end

Given /^"([^"]*)" has given the playlist "([^"]*)" a rating of "([^"]*)"$/ do |user_name, playlist_name, rating|
  @user = User.find_by_name user_name
  @playlist = Playlist.find_by_name playlist_name
  rating = rating.to_i
  @pr = PlaylistRating.new
  @pr.user_id = @user.id
  @pr.playlist_id = @playlist.id
  @pr.rating = rating
  @pr.save
end