require 'spec_helper'

describe UserSessionsController do
  describe "When rendering the login page" do
    it "should render the damn login page" do
      get :new
      response.should render_template("new")
    end
  end
  
  describe "When logging in" do
    before(:each) do
      @userSession = UserSession.new
      @userSession.stub!(:record).and_return(mock('record', {:id=>42}))
      @userSession.stub!(:save).and_return(true)
      @controller.stub!(:require_no_user).and_return(true)
      UserSession.stub!(:new).and_return(@userSession)
      UserSession.stub!(:find).and_return(@userSession)
      @user = User.new
    end
    
    it "should render the root for good login" do
      User.should_receive(:find).with(42).and_return(@user)
      post :create      
      response.should be_redirect
      assigns[:current_user].should == @user
    end
    
    it "should render the root for bad login" do
      @userSession.stub!(:save).and_return(false)
      post :create      
      response.should be_redirect
    end
    
    it "should render the show partial for good js login" do
      User.should_receive(:find).with(42).and_return(@user)
      post :create, :format=>'js'
      response.should render_template("users/_show.html.erb")
      assigns[:current_user].should == @user
    end
    
    it "should render the new partial for bad login" do
      @userSession.stub!(:save).and_return(false)
      post :create, :format=>'js'
      response.should render_template("user_sessions/_new.html.erb")
    end
  end
  
  describe "When destroying a session" do
    it "should destroy the session" do
      @session = mock_model(UserSession)
      @session.should_receive(:destroy)
      @controller.stub!(:current_user_session).and_return(@session)
      @controller.stub!(:require_user).and_return(true)
      post :destroy
      flash[:notice].should == "Logout successful!"      
    end
  end
end