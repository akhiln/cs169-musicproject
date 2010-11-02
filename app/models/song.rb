class Song < ActiveRecord::Base	
  has_many :playlists_songss
  has_many :playlists, :through => :playlists_songss
  has_many :usersongs
  has_many :users, :through => :usersongs

  def upload(uploadFile)
    name = uploadFile['datafile'].original_filename
    directory = "public/songs"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(uploadFile['datafile'].read) }
	@source = path
	self.save
  end
end
