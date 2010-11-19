class BookmarksController < ApplicationController
   before_filter :require_user
   def create
      @bookmark = Bookmark.new
      @bookmark.playlist_id = params[:playlist_id]
      @bookmark.user_id = @current_user.id
      if @bookmark.save
        redirect_to(@current_user, :notice => 'Bookmark was successfully created.')
      else
        @playlist = Playlist.find(params[:playlist_id])
        redict_to(@playlist, :notive => 'There was an error, your bookmark could not be saved')
      end
   end
end
