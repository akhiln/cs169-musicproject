require 'spec_helper'

describe PlaylistsSongsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/playlists_songs" }.should route_to(:controller => "playlists_songs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/playlists_songs/new" }.should route_to(:controller => "playlists_songs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/playlists_songs/1" }.should route_to(:controller => "playlists_songs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/playlists_songs/1/edit" }.should route_to(:controller => "playlists_songs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/playlists_songs" }.should route_to(:controller => "playlists_songs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/playlists_songs/1" }.should route_to(:controller => "playlists_songs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/playlists_songs/1" }.should route_to(:controller => "playlists_songs", :action => "destroy", :id => "1") 
    end
  end
end
