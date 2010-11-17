

class User < ActiveRecord::Base
  
  has_many :usersongs
  has_many :songs, :through => :usersongs 
  has_many :playlists

  acts_as_authentic do |c|
    c.transition_from_restful_authentication = true
  end


  def upload_picture(uploadFile)
    name = self.login.hash.to_s
    directory = "/images"
    # create the file path
    path = File.join(directory, name)
    # write the file
    begin
    File.open('public' + path, "wb") { |f| f.write(uploadFile['datafile'].read) }
	self.pic = path
	self.save
    rescue
       self.pic = "/images/default.jpg"
       self.save
    end
  end

  
end
