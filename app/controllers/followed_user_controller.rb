class FollowedUserController < ApplicationController
  before_filter :require_user

  def new
    @followed_user = FollowedUser.new
    @followed_user.followed_id = params[:followed_id]
    @follows = User.find(params[:followed_id])
    respond_to do |format|
       format.html
       format.xml   { render :xml => @followed_user }
    end
  end


  def create
     @followed_user = FollowedUser.new(params[:followed_user]);
     @follows = User.find(@followed_user.followed_id)
     @confirm = false;
     @error_message = ''
     if @followed_user.subscriber_id == @followed_user.followed_id
        @error_message = "Sorry, you may not become a fan of yourself."
     elsif FollowedUser.find(:first, :conditions => {:subscriber_id => @followed_user.subscriber_id, 
                                                     :followed_id => @followed_user.followed_id})
        @error_message = "You are already a fan of #{@follows.name}."
     else
     	@confirm = @followed_user.save
        if @confirm
          @action = Action.new :user_id =>current_user.id, :action =>"create", :obj_type =>"subscription", 
                                                                              :obj_id =>@followed_user.id
          @action.save
        end
        @error_message = "An unknown error occured. Please try again."
     end
  end
  
end
