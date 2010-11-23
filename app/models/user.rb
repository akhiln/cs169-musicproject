

class User < ActiveRecord::Base
  
  has_many :song_comments
  has_many :song_ratings
  has_many :playlist_comments
  has_many :bookmarks
  has_many :usersongs
  has_many :songs, :through => :usersongs 
  has_many :playlists

  
  has_attached_file :photo,
     #:default_url => '/images/default.jpg',
     :storage => :s3,
     :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                        :secret_access_key => ENV['S3_SECRET'] },
     :styles => {
           :thumb => "100x100#",
           :large => "850x150#" },
     :path => "/photos/:id/:style.:extension",
     :bucket => "prod.jukebox",
     :default_style => :large

  #validates_attachment_content_type :photo, :content_type => ["image/jpeg","image/jpg","image/png"]
  #validates_attachment_size :photo, :less_than => 3.megabytes

  acts_as_authentic do |c|
    #c.transition_from_restful_authentication = true
    c.login_field = :login
  end


#  def upload_picture(uploadFile)
#    if uploadFile == nil
#       self.pic = "/images/default.jpg"
#       self.save
#    elsif uploadFile['datafile'] == nil || uploadFile['datafile'] == ""
#       self.pic = "/images/default.jpg"
#       self.save
#    else
#      name = self.login.hash.to_s
#      directory = "/images"
#      # create the file path
#      path = File.join(directory, name)
#      # write the file
#      begin
#        File.open('public' + path, "wb") { |f| f.write(uploadFile['datafile'].read) }
#        self.pic = path
#        self.save
#      rescue
#         self.pic = "/images/default.jpg"
#         self.save
#      end
#    end
#  end

  
end
