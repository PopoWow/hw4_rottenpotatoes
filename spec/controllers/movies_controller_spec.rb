require 'spec_helper'

describe MoviesController do
  describe 'Show list of movies' do
    it 'should show the list of movies when requested' do
      post :index
      response.should render_template('index')
    end
  end
  
  describe 'Find similar movies by director' do
    
    it 'should be able to find movies by valid id' do
      fake_movie = mock("movie1")
      Movie.stub(:find).and_return(fake_movie)
      fake_movie.stub(:[]).with('director').and_return("blah blah")
      fake_movies = [mock("movie2"), mock("movie3")]
      Movie.stub(:get_similar_movies).and_return(fake_movies)
      post :by_director, 'id' => '1'
      response.should render_template('by_director')
    end
    
    it 'should redirect to the homepage if no director info found' do
      fake_movie = mock("movie1")
      Movie.stub(:find).and_return(fake_movie)
      fake_movie.stub(:[]).with('director').and_return(nil)
      fake_movie.stub(:[]).with('title').and_return("blah blah")      
      post :by_director, 'id' => '1'
      response.should redirect_to(movies_path)
    end
      
    it 'should look up all movies by the director of the reference movie' do
      movie = Movie.find(1)
      movies = Movie.get_similar_movies movie.director
      movies.length.should_not == 0
    end
    
    it 'should blah blah blah' do
      pending 'blah blah'
    end    
  end
end
