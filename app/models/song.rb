class Song < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :source, :user_id
end
