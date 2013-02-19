class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.get_similar_movies(director_name)
    Movie.find_all_by_director director_name
  end
end
