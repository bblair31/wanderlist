# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city, counter_cache: true

  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :content, length: { minimum: 20, maximum: 10_000 }
  validates :date_visited, presence: true
  validate :date_visited_cannot_be_in_future

  scope :recent, -> { order(created_at: :desc) }
  scope :by_rating, ->(rating) { where(rating: rating) if rating.present? }
  scope :highest_rated, -> { order(rating: :desc) }

  private

  def date_visited_cannot_be_in_future
    return unless date_visited.present? && date_visited > Time.zone.today

    errors.add(:date_visited, "can't be in the future. You can't review a place you haven't visited yet!")
  end
end
