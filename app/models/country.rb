class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :reviews, through: :cities
  has_many :tours, through: :cities
  validates :name, presence: true, uniqueness: true

  def self.has_reviews
    #return an array of countries that have reviews
    self.select{|country| country.country_review_count >= 1}
  end #end has_reviews class method

  def self.num_of_reviews_per_country
    #loop through the coutries reviewed array & collecting the review count of each countr - hash of key-country, value-country_review_count
    result = Hash.new(0)
    countries_reviewed = self.has_reviews
    countries_reviewed.each {|country| result[country.name] = country.country_review_count}
    result
  end

  def self.sort_num_of_reviews_per_country
    #returns nested array of sorted cities from least to most reviews
    self.num_of_reviews_per_country.sort_by {|country, count| count}
  end

  def self.top_5
    #returns only the top 5 reviewed countries as nested arrays.
    # ex. [["United States", 11], ["Canada", 11], ["Malaysia", 8]]
    self.sort_num_of_reviews_per_country.reverse[0..4]
  end

  def self.top_5_country_cities
    countries_reviewed = self.has_reviews
    #i want to select only the countries with the countries_reviewed array, that's country name matches the top 5
    names = self.top_5.map{|country_array| country_array[0]}
    countries = names.map{|name| Country.find_by(name: name)}
    c_cities = []
    countries.each do |country|
      c_cities << country.cities.select do |city|
        city.city_review_count >= 1
      end
    end
    c_cities
  end

### Instance methods

  def country_review_count
    self.reviews.count
  end #end  review_count method



end ### End of Country Class
