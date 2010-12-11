class Song < ActiveRecord::Base
  require 'open-uri'
  require 'mp3info'
  has_many :song_comments
  has_many :song_ratings
  has_many :playlistsongs
  has_many :playlists, :through => :playlistsongs
  has_many :usersongs
  has_many :users, :through => :usersongs
  belongs_to :genre


  has_attached_file :song,
     :storage => :s3,
     :s3_credentials => { :access_key_id     => ENV['S3_KEY'], 
                        :secret_access_key => ENV['S3_SECRET'] },
     :path => "/songs/:id",
     :bucket => ENV['S3_BUCKET'] 

  validates_attachment_presence :song
  validates_attachment_content_type :song, 
         :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]

  validate :attempt_id3_read

  def attempt_id3_read
     tmp_mp3 = Mp3Info.open(song.to_file.path)
     new_attr = {}
         if tmp_mp3.tag.album
           update_attribute(:album, tmp_mp3.tag.album.to_s)
         elsif tmp_mp3.tag1.album
           update_attribute(:album,tmp_mp3.tag1.album.to_s)
         end
         if tmp_mp3.tag.title
           update_attribute(:name, tmp_mp3.tag.title.to_s)
         elsif tmp_mp3.tag1.title
           update_attribute(:name, tmp_mp3.tag1.title.to_s)
         end
         
         @genre = nil
         if tmp_mp3.tag.genre_s
           @genre = Genre.find_by_genre_name tmp_mp3.tag.genre_s.to_s
         elsif tmp_mp3.tag1.genre_s
           @genre = Genre.find_by_genre_name tmp_mp3.tag1.genre_s.to_s
         end
         if @genre
           update_attribute(:genre_id, @genre.id)
         elsif @genre = Genre.find_by_genre_name("Other")
           update_attribute(:genre_id, @genre.id)
         end
         tmp_mp3.close
  end
  

  def makePlayer
    "<a href=\"#\" onclick=\"playListAdd(\'#{self.name}\', \'" + song.url + "\')\"><img src=\"/images/add_button.jpeg\" width=23 height=23 ></a>
	<a href=\"#\" onclick=\"playListAddAndPlay(\'#{self.name}\', \'" + song.url + "\')\"><img src=\"/images/play.png \" ></a>"
  end

  def renderRow
	link = link_to_remote self.name, {:url=>'/songs/show/'+self.id.to_s, :update=>'main_content'}
	return link
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
