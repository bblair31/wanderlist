class City < ApplicationRecord
  belongs_to :country
  validates :name, presence: true, uniqueness: true
end ### End of City Class
