class UsersSongs < ActiveRecord::Base
  #belongs_to :user
  #belongs_to :song

  validates_presence_of :user_id, :song_id
end
