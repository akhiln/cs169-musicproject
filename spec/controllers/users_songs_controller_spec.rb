require 'spec_helper'

describe UsersSongsController do

  def mock_users_songs(stubs={})
    @mock_users_songs ||= mock_model(UsersSongs, stubs)
  end

  describe "GET index" do
    it "assigns all users_songs as @users_songs" do
      UsersSongs.stub(:find).with(:all).and_return([mock_users_songs])
      get :index
      assigns[:users_songs].should == [mock_users_songs]
    end
  end

  describe "GET show" do
    it "assigns the requested users_songs as @users_songs" do
      UsersSongs.stub(:find).with("37").and_return(mock_users_songs)
      get :show, :id => "37"
      assigns[:users_songs].should equal(mock_users_songs)
    end
  end

  describe "GET new" do
    it "assigns a new users_songs as @users_songs" do
      UsersSongs.stub(:new).and_return(mock_users_songs)
      get :new
      assigns[:users_songs].should equal(mock_users_songs)
    end
  end

  describe "GET edit" do
    it "assigns the requested users_songs as @users_songs" do
      UsersSongs.stub(:find).with("37").and_return(mock_users_songs)
      get :edit, :id => "37"
      assigns[:users_songs].should equal(mock_users_songs)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created users_songs as @users_songs" do
        UsersSongs.stub(:new).with({'these' => 'params'}).and_return(mock_users_songs(:save => true))
        post :create, :users_songs => {:these => 'params'}
        assigns[:users_songs].should equal(mock_users_songs)
      end

      it "redirects to the created users_songs" do
        UsersSongs.stub(:new).and_return(mock_users_songs(:save => true))
        post :create, :users_songs => {}
        response.should redirect_to(users_song_url(mock_users_songs))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved users_songs as @users_songs" do
        UsersSongs.stub(:new).with({'these' => 'params'}).and_return(mock_users_songs(:save => false))
        post :create, :users_songs => {:these => 'params'}
        assigns[:users_songs].should equal(mock_users_songs)
      end

      it "re-renders the 'new' template" do
        UsersSongs.stub(:new).and_return(mock_users_songs(:save => false))
        post :create, :users_songs => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested users_songs" do
        UsersSongs.should_receive(:find).with("37").and_return(mock_users_songs)
        mock_users_songs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :users_songs => {:these => 'params'}
      end

      it "assigns the requested users_songs as @users_songs" do
        UsersSongs.stub(:find).and_return(mock_users_songs(:update_attributes => true))
        put :update, :id => "1"
        assigns[:users_songs].should equal(mock_users_songs)
      end

      it "redirects to the users_songs" do
        UsersSongs.stub(:find).and_return(mock_users_songs(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(users_song_url(mock_users_songs))
      end
    end

    describe "with invalid params" do
      it "updates the requested users_songs" do
        UsersSongs.should_receive(:find).with("37").and_return(mock_users_songs)
        mock_users_songs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :users_songs => {:these => 'params'}
      end

      it "assigns the users_songs as @users_songs" do
        UsersSongs.stub(:find).and_return(mock_users_songs(:update_attributes => false))
        put :update, :id => "1"
        assigns[:users_songs].should equal(mock_users_songs)
      end

      it "re-renders the 'edit' template" do
        UsersSongs.stub(:find).and_return(mock_users_songs(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested users_songs" do
      UsersSongs.should_receive(:find).with("37").and_return(mock_users_songs)
      mock_users_songs.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users_songs list" do
      UsersSongs.stub(:find).and_return(mock_users_songs(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(users_songs_url)
    end
  end

end
