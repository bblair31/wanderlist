class City < ApplicationRecord
  belongs_to :country
  has_many :reviews
  has_many :tours
  has_many :users, through: :reviews
  validates :name, presence: true
  validates :size, inclusion: {in: %w(small medium large)}
end ### End of City Class
