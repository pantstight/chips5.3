class Movie < ActiveRecord::Base
  
  def self.all_ratings
   Movie.distinct.pluck(:rating)
  end
  
  def self.with_ratings(ratings_list)
    ratings_list.nil? ? Movie.all : Movie.where(:rating => ratings_list.map(&:upcase))
  end
end
