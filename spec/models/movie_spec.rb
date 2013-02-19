require 'spec_helper'

describe Movie do
  fixtures :movies
  describe 'Searching for similar movies by director' do
    it 'should look up all movies by the director name' do
      movies = Movie.get_similar_movies 'Gus Van Sant'
      movies.length.should_not == 0
    end    
  end
end
