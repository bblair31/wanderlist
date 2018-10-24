require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @country = Country.create(name: "United States")
    @city = City.create(name: "New York", size: "large", country_id: @country.id, state_code: "NY")
    @user = User.create(first_name: "John", last_name: "Doe", email: "johndoe123@hotmail.com", password: "password123", password_confirmation: "password123")
  end

  let(:valid_attributes) do
    {
      rating: 5,
      content: "New York is a wonderful city. I love it so much. Best city in the world.",
      date_visited: "2016-12-02",
      user_id: @user.id,
      city_id: @city.id
    }
  end

  let(:outside_rating_range) { valid_attributes.merge(rating: 6) }
  let(:not_enough_content) { valid_attributes.merge(content: "Short review") }
  let(:future_review_date) { valid_attributes.merge(date_visited: Date.today + 1) }

  it "is valid when expected" do
    expect(Review.new(valid_attributes)).to be_valid
  end

  it "is invalid when rating is not an integer between 1-5" do
    expect(Review.new(outside_rating_range)).to be_invalid
  end

  it "is invalid when content length is not more than 20 characters" do
    expect(Review.new(not_enough_content)).to be_invalid
  end

  it "is invalid when review_date is in the future" do
    expect(Review.new(future_review_date)).to be_invalid
  end

end ### End of Review_Spec
