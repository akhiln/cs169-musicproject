class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  

  # render new.rhtml
  def new
    @user = User.new
    render :action => 'new'
  end
  def edit_picture
     
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    
    success = @user && @user.save
    if success && @user.errors.empty?
      # save the profile picture:
        @user.upload_picture(params[:upload])
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
