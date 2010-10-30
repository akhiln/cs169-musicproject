require 'spec_helper'

describe UsersSongsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/users_songs" }.should route_to(:controller => "users_songs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/users_songs/new" }.should route_to(:controller => "users_songs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/users_songs/1" }.should route_to(:controller => "users_songs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/users_songs/1/edit" }.should route_to(:controller => "users_songs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/users_songs" }.should route_to(:controller => "users_songs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/users_songs/1" }.should route_to(:controller => "users_songs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/users_songs/1" }.should route_to(:controller => "users_songs", :action => "destroy", :id => "1") 
    end
  end
end
