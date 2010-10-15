require 'spec_helper'

describe PlaylistsController do

  def mock_playlist(stubs={})
    @mock_playlist ||= mock_model(Playlist, stubs)
  end

  describe "GET index" do
    it "assigns all playlists as @playlists" do
      Playlist.stub(:find).with(:all).and_return([mock_playlist])
      get :index
      assigns[:playlists].should == [mock_playlist]
    end
  end

  describe "GET show" do
    it "assigns the requested playlist as @playlist" do
      Playlist.stub(:find).with("37").and_return(mock_playlist)
      get :show, :id => "37"
      assigns[:playlist].should equal(mock_playlist)
    end
  end

  describe "GET new" do
    it "assigns a new playlist as @playlist" do
      Playlist.stub(:new).and_return(mock_playlist)
      get :new
      assigns[:playlist].should equal(mock_playlist)
    end
  end

  describe "GET edit" do
    it "assigns the requested playlist as @playlist" do
      Playlist.stub(:find).with("37").and_return(mock_playlist)
      get :edit, :id => "37"
      assigns[:playlist].should equal(mock_playlist)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created playlist as @playlist" do
        Playlist.stub(:new).with({'these' => 'params'}).and_return(mock_playlist(:save => true))
        post :create, :playlist => {:these => 'params'}
        assigns[:playlist].should equal(mock_playlist)
      end

      it "redirects to the created playlist" do
        Playlist.stub(:new).and_return(mock_playlist(:save => true))
        post :create, :playlist => {}
        response.should redirect_to(playlist_url(mock_playlist))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        Playlist.stub(:new).with({'these' => 'params'}).and_return(mock_playlist(:save => false))
        post :create, :playlist => {:these => 'params'}
        assigns[:playlist].should equal(mock_playlist)
      end

      it "re-renders the 'new' template" do
        Playlist.stub(:new).and_return(mock_playlist(:save => false))
        post :create, :playlist => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested playlist" do
        Playlist.should_receive(:find).with("37").and_return(mock_playlist)
        mock_playlist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :playlist => {:these => 'params'}
      end

      it "assigns the requested playlist as @playlist" do
        Playlist.stub(:find).and_return(mock_playlist(:update_attributes => true))
        put :update, :id => "1"
        assigns[:playlist].should equal(mock_playlist)
      end

      it "redirects to the playlist" do
        Playlist.stub(:find).and_return(mock_playlist(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(playlist_url(mock_playlist))
      end
    end

    describe "with invalid params" do
      it "updates the requested playlist" do
        Playlist.should_receive(:find).with("37").and_return(mock_playlist)
        mock_playlist.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :playlist => {:these => 'params'}
      end

      it "assigns the playlist as @playlist" do
        Playlist.stub(:find).and_return(mock_playlist(:update_attributes => false))
        put :update, :id => "1"
        assigns[:playlist].should equal(mock_playlist)
      end

      it "re-renders the 'edit' template" do
        Playlist.stub(:find).and_return(mock_playlist(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested playlist" do
      Playlist.should_receive(:find).with("37").and_return(mock_playlist)
      mock_playlist.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the playlists list" do
      Playlist.stub(:find).and_return(mock_playlist(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(playlists_url)
    end
  end

end
