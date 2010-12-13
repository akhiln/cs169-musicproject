class FollowedUserController < ApplicationController
  before_filter :require_user

  def new
    @followed_user = FollowedUser.new
    @followed_user.followed_user_id = params[:followed_id]
    @follows = User.find(params[:followed_id])
    respond_to do |format|
       format.html
       format.xml   { render :xml => @followed_user }
    end
  end


  def create
     @followed_user = FollowedUser.new(params[:followed_user]);
     @follows = User.find(@followed_user.followed_user_id)
     @confirm = @followed_user.save
  end
  
end
