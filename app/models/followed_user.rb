class PlaylistComment < ActiveRecord::Base
   belongs_to :subscriber, {:class => :user,
                            :foreign_key => :user_id}
   belongs_to :follows, {:class => :user,
                         :foreign_key => :followed_user_id}
end
