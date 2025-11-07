# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :cities, through: :reviews
  has_many :tours, through: :cities
  has_many :photos, dependent: :destroy
  has_many :conversations, dependent: :destroy

  has_secure_password

  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true

  scope :search_by_name, lambda { |query|
    return all if query.blank?

    sanitized_query = sanitize_sql_like(query.strip)
    where('first_name LIKE :query OR last_name LIKE :query', query: "%#{sanitized_query}%")
  }

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorite_city
    cities_with_review_counts.max_by { |_city, count| count }
  end

  def least_favorite_city
    cities_with_review_counts.min_by { |_city, count| count }
  end

  def profile_photo_url
    photos.first&.url
  end

  private

  def cities_with_review_counts
    reviews.group_by(&:city).transform_values(&:count)
  end
end

