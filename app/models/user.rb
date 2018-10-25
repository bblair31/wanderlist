class User < ApplicationRecord
  has_many :reviews
  has_many :cities, through: :reviews
  has_many :tours, through: :cities
  has_many :photos, dependent: :destroy
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: false
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def user_review_count
    self.reviews.count
  end

  def cities_reviewed
    #returns array of cities reviewed
    self.reviews.map {|r| r.city}
  end

  def num_of_reviews_per_city
    #loop through the cities reviewed array & count how many times a city repeats - hash of key-city, value-count
    result = Hash.new(0)
    self.cities_reviewed.each {|city| result[city.name] += 1}
    result
  end

  def sort_num_of_reviews_per_city
    #returns nested array of sorted cities from least to most reviews
    self.num_of_reviews_per_city.sort_by {|city, count| count}
  end

  def favorite_city
    # should return [city_name, review_count] for the highest value-review#s. ex. ["Montreal", 2]
    self.sort_num_of_reviews_per_city.reverse[0]
  end

  def least_favorite_city
    # should return the city key with the lowest value-review#s
    self.sort_num_of_reviews_per_city[0]
  end

  def my_photo_url
    my_photos = self.photos.map do |photo|
      photo.url
    end
    my_photos.first.to_s
  end

  def first_photo
    @photo = self.photos.last
  end

end ### End of User Class
