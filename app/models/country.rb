# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :reviews, through: :cities
  has_many :tours, through: :cities

  validates :name, presence: true, uniqueness: true

  scope :with_reviews, -> { joins(:reviews).distinct }
  scope :by_review_count, -> { left_joins(:reviews).group(:id).order('COUNT(reviews.id) DESC') }
  scope :top, ->(limit = 5) { with_reviews.by_review_count.limit(limit) }

  def review_count
    reviews.count
  end

  def cities_with_reviews
    cities.joins(:reviews).distinct
  end
end
