class Song < ActiveRecord::Base	
	
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
