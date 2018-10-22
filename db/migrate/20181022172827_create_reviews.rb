class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.date :date_visited
      t.date :review_date
      t.integer :user_id
      t.integer :city_id

      t.timestamps
    end
  end
end
