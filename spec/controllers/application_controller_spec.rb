require 'spec_helper'

describe ApplicationController do
  describe "current_user_session" do
    it "should find the session if no session is stored" do
      pending
      @session = mock_model(UserSession)
      UserSession.should_receive(:find).and_return(@session)
      @controller.current_user_session.should == @session
    end
    
    it "should use the stored session if a session is stored" do
      pending
      @session = mock_model(UserSession)
      UserSession.should_receive(:find).and_return(@session)
      @controller.current_user_session.should == @session
      UserSession.stub!(:find).and_return(nil)
      @controller.current_user_session.should == @session
    end
  end
end