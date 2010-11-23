class Song < ActiveRecord::Base	
  has_many :song_comments
  has_many :song_ratings
  has_many :playlistsongs
  has_many :playlists, :through => :playlistsongs
  has_many :usersongs
  has_many :users, :through => :usersongs

  has_attached_file :song,
     :storage => :s3,
     :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                        :secret_access_key => ENV['S3_SECRET'] },
     :path => "/songs/:id",
     :bucket => "prod.jukebox"
  
  def upload(uploadFile)
    if uploadFile == nil
      return false
    end
    if uploadFile['datafile'] == nil || uploadFile['datafile'] == ""
      return false
    end
    
    name = uploadFile['datafile'].original_filename
    directory = "public/songs"
    # create the file path
    if name[-4,4] == ".mp3"
      path = File.join(directory, self.id.to_s + ".mp3")
      # write the file
      File.open(path, "wb") { |f| f.write(uploadFile['datafile'].read) }
      @source = path
      self.save
      return true
    else
      false
    end
  end
  
  def makePlayer
    '<a href="#" onclick="playListAdd(\'song.name\', \'' + song.url + '\')"><img src="/images/playadd.png"></a>
	<a href="#" onclick="playListAddAndPlay(\'song.name\', \'' + song.url + '\')"><img src="/images/play.png"></a>'
  end
  
  def renderRow
	link = link_to_remote self.name, {:url=>'/songs/show/'+self.id.to_s, :update=>'main_content'}
	return link
  end
  
  def ratingString
    if self.rating == nil
      "-"
    else
      sprintf("%.2f", self.rating)
    end
  end
  
  def updateRating
    total = 0.0
    count = 0.0
    self.song_ratings.each do |song_rating|
      count = count + 1
      total = total + song_rating.rating
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
