require 'spec_helper'

describe ApplicationHelper do
  it "should run facebook_like properly" do
    helper.should_receive(:convert_url).with("youAreEll").and_return("wheee!")
    @fbl = helper.facebook_like "youAreEll"
    @fbl[:src].should == "http://www.facebook.com/plugins/like.php?href=wheee!&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=segoe+ui&amp;colorscheme=light&amp;height=80"
    @fbl[:frameborder].should == "0"
    @fbl[:style].should == "border:none; overflow:hidden; width:450px; height:80px;"
    @fbl[:allowTransparency].should == :true
  end
  
  it "should run facebook_box properly" do
    helper.should_receive(:convert_url).with("youAreEll").and_return("fubar")
    @fbb = helper.facebook_box "youAreEll"
    @fbb[:src].should == "http://www.facebook.com/plugins/activity.php?href=fubar&amp;width=300&amp;colorscheme=dark&amp;connections=10&amp;stream=false&amp;header=true&amp;height=287"
    @fbb[:frameborder].should == "0"
    @fbb[:style].should == "border:none; overflow:hidden; width:300px; height:287px;"
    @fbb[:allowTransparency].should == :true
  end
  
  it "should run convert_url properly" do
    @converted_url = helper.convert_url "/you:AreEll/"
    @converted_url.should == "%2Fyou%3AAreEll%2F"
  end
  
  it "should run print_event properly when commenting" do
    @act = {:obj_type=>"comment", :action=>"comment"}
    helper.print_event(@act).should == "Just commented on the comment called"
  end
  
  it "should run print_event properly when not commenting" do
    @act = {:obj_type=>"cure for cancer", :action=>"create"}
    helper.print_event(@act).should == "Just created a new cure for cancer called"
  end
  
  describe "when running time_elapsed_since" do
    before (:each) do
      @zone = mock('zone')
      @zone.stub!(:now).and_return(100000)
      Time.stub!(:zone).and_return(@zone)
    end
    
    it "should display 1 minute if it has been less than 2 minutes" do
      helper.time_elapsed_since(99999).should == "1 minute ago"
    end
    
    it "should display minutes if it has been less than 1 hour" do
      helper.time_elapsed_since(99700).should == "5 minutes ago"
    end
    
    it "should display hours if it has been less than 1 day" do
      helper.time_elapsed_since(90000).should == "2 hours ago"
    end
    
    it "should display days if it has been more than 1 day" do
      helper.time_elapsed_since(10000).should == "1 day ago"
    end
  end
end
