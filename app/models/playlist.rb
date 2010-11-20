class Playlist < ActiveRecord::Base
  has_many :playlist_comments
  has_many :bookmarks
  has_many :playlistsongs
  has_many :playlist_ratings
	has_many :songs, :through => :playlistsongs
 	belongs_to :user
	
	validates_presence_of :name, :user_id
  
  def rating
    total = 0.0
    count = 0.0
    self.playlist_ratings.each do |playlist_rating|
      count = count + 1
      total = total + playlist_rating.rating
    end
    if count <= 0
      "-"
    else
      sprintf("%.2f",(total / count))
    end
  end
end
