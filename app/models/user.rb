class User < ApplicationRecord
  has_many :reviews
  has_many :cities, through: :reviews
  has_many :tours, through: :cities
  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: false
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end ### End of User Class
