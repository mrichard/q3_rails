class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.locate_movies_by_director title
  	chosen_movie = Movie.find_by_title title

    if chosen_movie.director == ''
      return nil
    else
      return Movie.find_all_by_director(chosen_movie.director)
    end
  end
end
