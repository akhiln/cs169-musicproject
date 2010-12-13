class IndexController < ApplicationController
  def index
    if current_user
      @actions = list_of_user_actions()
    else
      @actions = list_of_general_actions()
    end
    if params['url']
      @urli = 'clientSideInclude("main_content","http://project-jukebox.heroku.com'+params['url']+'");'
      @title = params['title']
      @urlfb = 'http://project-jukebox.heroku.com/index?url=' + params['url'] + '&title=' + params['title']
    end
  end

 def auth_home
    @actions = list_of_friend_actions
    render :partial => 'index/auth_home'
 end
  

  private
  def list_of_user_actions()
    Action.find(:all,:readonly, :limit => 20, :order => "created_at DESC", :conditions =>["user_id = ?",current_user.id])
  end

  def list_of_general_actions()
    Action.find(:all, :readonly, :limit => 20, :order => "created_at DESC")
  end

  def list_of_friend_actions
    id_arr =[current_user.id]
    current_user.subscribers.each do |subs|
       id_arr << subs.followed_id
    end
    Action.find(:all,:readonly, :limit => 20, :order => "created_at DESC", :conditions => ["user_id IN (?)",id_arr])
  end

  
end
