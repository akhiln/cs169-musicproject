class Action < ActiveRecord::Base
  def eventString
    ot = self.obj_type
    event =  self.action == "comment"   ? self.action+"ed on the "+ot+" called" : 
            (ot == "subscription" ? "is now following " : 
             self.action+"d a new "+ot+" called")
    sprintf("%s",event.capitalize)
  end

  #returns the url of the object that was commented on/the person that was followed
  def objURL
    if self.action == "create"
      return "/songs/show/"+self.obj_id.to_s     if self.obj_type == "song"
      return "/playlists/show/"+self.obj_id.to_s if self.obj_type == "playlist"
      return "/users/show/"+self.obj_id.to_s
    else   #its a comment action
      return "/songs/show/"+(SongComment.find(self.obj_id).song.id.to_s)             if self.obj_type == "song"
      return "/playlists/show/"+(PlaylistComment.find(self.obj_id).playlist.id.to_s) if self.obj_type == "playlist"
    end
  end
  #returns the name of the object that was commented on/the person that was followed
  def objName
    if self.action == "comment"
      return (self.obj_type =="playlist") ? (PlaylistComment.find(self.obj_id).playlist.name) : (SongComment.find(self.obj_id).song.name)
    end
    return Song.find(self.obj_id).name     if self.obj_type == "song"
    return Playlist.find(self.obj_id).name if self.obj_type == "playlist"
    return User.find(self.obj_id).name      if self.obj_type == "subscription"
  end

  def getUser
    User.find(self.user_id)
  end

  def getCreator
    return (self.obj_type =="playlist") ? (PlaylistComment.find(self.obj_id).playlist.user) : (SongComment.find(self.obj_id).song.users[0])
  end

  def creatorName
    return (self.obj_type =="playlist") ? (PlaylistComment.find(self.obj_id).playlist.user.name) : (SongComment.find(self.obj_id).song.users[0].name)
  end

  def getObj
    return (self.obj_type =="playlist") ? (PlaylistComment.find(self.obj_id)) : (SongComment.find(self.obj_id)) if self.action == "comment"
  end

end
