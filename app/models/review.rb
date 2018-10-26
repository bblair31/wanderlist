class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6}
  validates :content, length: {minimum: 20, maximum: 10000}
  validate :rev_date_after_visit

  def rev_date_after_visit
    review_date = Time.now
    if review_date < date_visited
      errors.add(:date_visited, "is in the future. Can't review if you haven't visited yet!")
    end
  end #end rev_date_after_visit method

end ### End of Review Class
