class FollowedUser < ActiveRecord::Base
   belongs_to :subscriber, :class_name => "User"
   belongs_to :followed, :class_name => "User"
end
