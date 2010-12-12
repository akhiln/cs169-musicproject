class IndexController < ApplicationController
  def index
    actions = Action.find(:all, :readonly, :limit => 20, :order => "created_at DESC")
    @actions = []
    actions.each do |a|
      current_action = {:user => User.find(a.user_id), :action => a.action, :obj_type => a.obj_type, :created_at =>a.created_at}
      puts current_action[:obj_type]
      if current_action[:obj_type] == "song"
        if current_action[:action] == "create"
          current_action[:obj] = Song.find a.obj_id
        else
          current_action[:obj] = SongComment.find a.obj_id
        end
      else 
        if current_action[:action] == "create"
          current_action[:obj] = Playlist.find a.obj_id
        else
          current_action[:obj] = PlaylistComment.find a.obj_id
        end
      end
      @actions.push current_action
    end
	if params['url']
		@urli = 'clientSideInclude("main_content","http://localhost:3000'+params['url']+'");'
		@title = params['title']
		@urlfb = 'http://localhost:3000/index?url=' + params['url'] + '&title=' + params['title']
	end
  end
end
