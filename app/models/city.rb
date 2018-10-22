class City < ApplicationRecord
  belongs_to :country
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: true, uniqueness: true
end ### End of City Class
