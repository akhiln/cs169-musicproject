require 'spec_helper'

describe GenresController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/genres" }.should route_to(:controller => "genres", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/genres/new" }.should route_to(:controller => "genres", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/genres/1" }.should route_to(:controller => "genres", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/genres/1/edit" }.should route_to(:controller => "genres", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/genres" }.should route_to(:controller => "genres", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/genres/1" }.should route_to(:controller => "genres", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/genres/1" }.should route_to(:controller => "genres", :action => "destroy", :id => "1") 
    end
  end
end
