class Playlist < ActiveRecord::Base
  has_many :playlist_comments
  has_many :bookmarks
  has_many :playlistsongs
  has_many :playlist_ratings
	has_many :songs, :through => :playlistsongs
 	belongs_to :user
	
	validates_presence_of :name, :user_id
  
  def renderRow
	songsString = ''
    self.songs.each do |song|
		songsString += 'playListAdd(\'' + song.name + '\',\'' + song.song.url + '\'); '
	end
	return '<a href="#" onclick="'+songsString+'"><img src="/images/add_button.gif" width=23 height=23></a><a href="#" onclick="'+songsString+' playListChange(myPlayList.length-'+songs.length.to_s+');"><img src="/images/play.png"></a>'
  end
  
  
  def ratingString
    if self.rating == nil
      "0.00"
    else
      sprintf("%.2f", self.rating)
    end
  end
  
  def updateRating
    total = 0.0
    count = 0.0
    self.playlist_ratings.each do |playlist_rating|
      count = count + 1
      total = total + playlist_rating.rating
    end
    if count == 0
      self.rating = nil
      self.save
    elsif self.rating != total/count
      self.rating = total/count
      self.save
    end
  end
end
