class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :reviews, through: :cities
  validates :name, presence: true, uniqueness: true
end ### End of Country Class
