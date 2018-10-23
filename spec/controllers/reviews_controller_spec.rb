require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

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

  let(:invalid_attributes) do
    {
      rating: 6,
      content: "New",
      date_visited: "2021-12-02",
      user_id: nil,
      city_id: nil
    }
  end

  
end ### End of ReviewsController Tests
