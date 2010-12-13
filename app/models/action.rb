class Action < ActiveRecord::Base
  def eventString
    ot = self.obj_type
    event =  self.action == "comment" ? self.action+"ed on the "+ot+" called" : 
            (ot == "subscription"     ? "is now following " : 
            (ot == "bookmark"         ? ot+"ed the playlist " : 
             self.action+"d a new "+ot+" called"))
    sprintf("%s",event.capitalize)
  end

  #returns the url of the object that was commented on/the person that was followed
  def objURL
    if self.action == "create"
      return "/songs/show/"+self.obj_id.to_s     if self.obj_type == "song"
      return "/playlists/show/"+self.obj_id.to_s if self.obj_type == "playlist"
      return "/playlists/show/"+(Bookmark.find(self.obj_id).playlist_id.to_s)        if self.obj_type == "bookmark"
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
    return Playlist.find(Bookmark.find(self.obj_id).playlist_id).name if self.obj_type == "bookmark"
  end

  def getUser
    User.find(self.user_id)
  end

  def getCreator
    obj = getObj()
    return obj.user if self.obj_type == "bookmark"
    return obj.playlist.user if self.obj_type == "playlist"
    return obj.song.users[0]
  end

  def creatorName
    c = getCreator()
    c.name
  end

  def getObj
    return Playlist.find(Bookmark.find(self.obj_id).playlist_id) if self.obj_type == "bookmark"
    return (self.obj_type =="playlist") ? (PlaylistComment.find(self.obj_id)) : (SongComment.find(self.obj_id)) if self.action == "comment"
  end

end
