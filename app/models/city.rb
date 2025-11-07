# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :country
  has_many :reviews, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :size, inclusion: { in: %w[small medium large] }

  scope :with_reviews, -> { joins(:reviews).distinct }
  scope :by_review_count, -> { left_joins(:reviews).group(:id).order('COUNT(reviews.id) DESC') }
  scope :top, ->(limit = 5) { with_reviews.by_review_count.limit(limit) }

  delegate :name, to: :country, prefix: true, allow_nil: true

  def average_rating
    return 'No reviews yet' if reviews.none?

    (reviews.average(:rating) || 0).round(1)
  end
end
