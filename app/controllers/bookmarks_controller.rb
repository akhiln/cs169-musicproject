class BookmarksController < ApplicationController
   before_filter :require_user
 
  def new
     @bookmark = Bookmark.new
     @bookmark.playlist_id = params[:playlist_id]
     @playlist = Playlist.find(@bookmark.playlist_id)
  end



   def create
      @bookmark = Bookmark.new(params[:bookmark])
      @playlist = Playlist.find(@bookmark.playlist_id)
      @error_message = ''
      if Bookmark.find(:first, :conditions => {:user_id => @bookmark.user_id, 
                                               :playlist_id => @bookmark.playlist_id})
         @error_message = "You have already booked this playlist."
      else
         @confirm = @bookmark.save
         if @confirm
           @action = Action.new :user_id =>current_user.id, :action =>"create", :obj_type =>"bookmark", 
                                                                            :obj_id =>@bookmark.id
           @action.save
         else
           @error_message = "Unknown error. Please try again."
         end
      end
   end
end
