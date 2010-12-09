require 'spec_helper'

describe GenresController do

  def mock_genre(stubs={})
    @mock_genre ||= mock_model(Genre, stubs)
  end

  describe "GET index" do
    it "assigns all genres as @genres" do
      Genre.stub(:find).with(:all).and_return([mock_genre])
      get :index
      assigns[:genres].should == [mock_genre]
    end
  end

  describe "GET show" do
    it "assigns the requested genre as @genre" do
      Genre.stub(:find).with("37").and_return(mock_genre)
      get :show, :id => "37"
      assigns[:genre].should equal(mock_genre)
    end
  end

  describe "GET new" do
    it "assigns a new genre as @genre" do
      Genre.stub(:new).and_return(mock_genre)
      get :new
      assigns[:genre].should equal(mock_genre)
    end
  end

  describe "GET edit" do
    it "assigns the requested genre as @genre" do
      Genre.stub(:find).with("37").and_return(mock_genre)
      get :edit, :id => "37"
      assigns[:genre].should equal(mock_genre)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created genre as @genre" do
        Genre.stub(:new).with({'these' => 'params'}).and_return(mock_genre(:save => true))
        post :create, :genre => {:these => 'params'}
        assigns[:genre].should equal(mock_genre)
      end

      it "redirects to the created genre" do
        Genre.stub(:new).and_return(mock_genre(:save => true))
        post :create, :genre => {}
        response.should redirect_to(genre_url(mock_genre))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved genre as @genre" do
        Genre.stub(:new).with({'these' => 'params'}).and_return(mock_genre(:save => false))
        post :create, :genre => {:these => 'params'}
        assigns[:genre].should equal(mock_genre)
      end

      it "re-renders the 'new' template" do
        Genre.stub(:new).and_return(mock_genre(:save => false))
        post :create, :genre => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested genre" do
        Genre.should_receive(:find).with("37").and_return(mock_genre)
        mock_genre.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :genre => {:these => 'params'}
      end

      it "assigns the requested genre as @genre" do
        Genre.stub(:find).and_return(mock_genre(:update_attributes => true))
        put :update, :id => "1"
        assigns[:genre].should equal(mock_genre)
      end

      it "redirects to the genre" do
        Genre.stub(:find).and_return(mock_genre(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(genre_url(mock_genre))
      end
    end

    describe "with invalid params" do
      it "updates the requested genre" do
        Genre.should_receive(:find).with("37").and_return(mock_genre)
        mock_genre.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :genre => {:these => 'params'}
      end

      it "assigns the genre as @genre" do
        Genre.stub(:find).and_return(mock_genre(:update_attributes => false))
        put :update, :id => "1"
        assigns[:genre].should equal(mock_genre)
      end

      it "re-renders the 'edit' template" do
        Genre.stub(:find).and_return(mock_genre(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested genre" do
      Genre.should_receive(:find).with("37").and_return(mock_genre)
      mock_genre.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the genres list" do
      Genre.stub(:find).and_return(mock_genre(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(genres_url)
    end
  end

end
