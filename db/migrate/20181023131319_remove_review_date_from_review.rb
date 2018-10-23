class RemoveReviewDateFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :review_date, :date
  end
end
