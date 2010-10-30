require 'spec_helper'

describe PlaylistsSongsController do

  def mock_playlists_songs(stubs={})
    @mock_playlists_songs ||= mock_model(PlaylistsSongs, stubs)
  end

  describe "GET index" do
    it "assigns all playlists_songs as @playlists_songs" do
      PlaylistsSongs.stub(:find).with(:all).and_return([mock_playlists_songs])
      get :index
      assigns[:playlists_songs].should == [mock_playlists_songs]
    end
  end

  describe "GET show" do
    it "assigns the requested playlists_songs as @playlists_songs" do
      PlaylistsSongs.stub(:find).with("37").and_return(mock_playlists_songs)
      get :show, :id => "37"
      assigns[:playlists_songs].should equal(mock_playlists_songs)
    end
  end

  describe "GET new" do
    it "assigns a new playlists_songs as @playlists_songs" do
      PlaylistsSongs.stub(:new).and_return(mock_playlists_songs)
      get :new
      assigns[:playlists_songs].should equal(mock_playlists_songs)
    end
  end

  describe "GET edit" do
    it "assigns the requested playlists_songs as @playlists_songs" do
      PlaylistsSongs.stub(:find).with("37").and_return(mock_playlists_songs)
      get :edit, :id => "37"
      assigns[:playlists_songs].should equal(mock_playlists_songs)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created playlists_songs as @playlists_songs" do
        PlaylistsSongs.stub(:new).with({'these' => 'params'}).and_return(mock_playlists_songs(:save => true))
        post :create, :playlists_songs => {:these => 'params'}
        assigns[:playlists_songs].should equal(mock_playlists_songs)
      end

      it "redirects to the created playlists_songs" do
        PlaylistsSongs.stub(:new).and_return(mock_playlists_songs(:save => true))
        post :create, :playlists_songs => {}
        response.should redirect_to(playlists_song_url(mock_playlists_songs))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved playlists_songs as @playlists_songs" do
        PlaylistsSongs.stub(:new).with({'these' => 'params'}).and_return(mock_playlists_songs(:save => false))
        post :create, :playlists_songs => {:these => 'params'}
        assigns[:playlists_songs].should equal(mock_playlists_songs)
      end

      it "re-renders the 'new' template" do
        PlaylistsSongs.stub(:new).and_return(mock_playlists_songs(:save => false))
        post :create, :playlists_songs => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested playlists_songs" do
        PlaylistsSongs.should_receive(:find).with("37").and_return(mock_playlists_songs)
        mock_playlists_songs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :playlists_songs => {:these => 'params'}
      end

      it "assigns the requested playlists_songs as @playlists_songs" do
        PlaylistsSongs.stub(:find).and_return(mock_playlists_songs(:update_attributes => true))
        put :update, :id => "1"
        assigns[:playlists_songs].should equal(mock_playlists_songs)
      end

      it "redirects to the playlists_songs" do
        PlaylistsSongs.stub(:find).and_return(mock_playlists_songs(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(playlists_song_url(mock_playlists_songs))
      end
    end

    describe "with invalid params" do
      it "updates the requested playlists_songs" do
        PlaylistsSongs.should_receive(:find).with("37").and_return(mock_playlists_songs)
        mock_playlists_songs.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :playlists_songs => {:these => 'params'}
      end

      it "assigns the playlists_songs as @playlists_songs" do
        PlaylistsSongs.stub(:find).and_return(mock_playlists_songs(:update_attributes => false))
        put :update, :id => "1"
        assigns[:playlists_songs].should equal(mock_playlists_songs)
      end

      it "re-renders the 'edit' template" do
        PlaylistsSongs.stub(:find).and_return(mock_playlists_songs(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested playlists_songs" do
      PlaylistsSongs.should_receive(:find).with("37").and_return(mock_playlists_songs)
      mock_playlists_songs.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the playlists_songs list" do
      PlaylistsSongs.stub(:find).and_return(mock_playlists_songs(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(playlists_songs_url)
    end
  end

end
