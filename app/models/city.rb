class City < ApplicationRecord
  belongs_to :country
  has_many :reviews
  has_many :tours
  has_many :users, through: :reviews
  validates :name, presence: true
  validates :size, inclusion: {in: %w(small medium large)}

  def self.num_of_reviews_per_city_of_top_5_countries
    # returns {"New York"=>11, "Montreal"=>11, "Kuala Lumpur"=>8}
    result = Hash.new(0)
    nested_array = Country.top_5_country_cities
    nested_array.flatten.each {|city| result[city.name] = city.city_review_count}
    result
  end

  def self.sort_num_of_reviews_per_city_of_top_5_countries
    #returns nested array of sorted cities from least to most reviews
    self.num_of_reviews_per_city_of_top_5_countries.sort_by {|city, count| count}
  end

  def self.top_5
    #returns only the top 5 reviewed countries as nested arrays.
    # ex. [["United States", 11], ["Canada", 11], ["Malaysia", 8]]
    self.sort_num_of_reviews_per_city_of_top_5_countries.reverse[0..4]
  end

  def city_review_count
    self.reviews.count
  end
  
  def average_rating
    ratings_array = self.reviews.map {|r| r.rating}
    avg = ratings_array.reduce(:+).to_f / city_review_count
    avg.round(1)
  end


end ### End of City Class
