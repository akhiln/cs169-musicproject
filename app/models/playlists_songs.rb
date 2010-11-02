class PlaylistsSongs < ActiveRecord::Base
  #belongs_to :playlist
  #belongs_to :song

  validates_presence_of :playlist_id, :song_id
end
