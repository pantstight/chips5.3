class Movie < ActiveRecord::Base
  
  def self.all_ratings
   Movie.distinct.pluck(:rating)
  end
  
  def self.with_ratings(ratings_list, order_attr)
    movies = ratings_list.empty? ? Movie.all : Movie.where(:rating => ratings_list.map(&:upcase))
    unless order_attr.nil?
      movies = movies.order(order_attr)
    end
    movies
  end
end
