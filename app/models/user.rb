class User < ApplicationRecord
  has_many :reviews
  has_many :cities, through: :reviews
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}" 
  end
end
