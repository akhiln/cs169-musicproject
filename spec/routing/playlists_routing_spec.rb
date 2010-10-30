require 'spec_helper'

describe PlaylistsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/playlists" }.should route_to(:controller => "playlists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/playlists/new" }.should route_to(:controller => "playlists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/playlists/1" }.should route_to(:controller => "playlists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/playlists/1/edit" }.should route_to(:controller => "playlists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/playlists" }.should route_to(:controller => "playlists", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/playlists/1" }.should route_to(:controller => "playlists", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/playlists/1" }.should route_to(:controller => "playlists", :action => "destroy", :id => "1") 
    end
  end
end
