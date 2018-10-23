require 'rails_helper'

describe Tour do

  before do
    @country = Country.create(name: "United States")
    @city = City.create(name: "New York", size: "large", country_id: @country.id, state_code: "NY")
  end
  let(:attributes) do
    {
      name: "Red Line Bus Tour",
      duration: "Full Day",
      contact_info: "rlbtour@gmail.com",
      city_id: @city.id
    }
  end

  it "is considered valid" do
    expect(Tour.new(attributes)).to be_valid
  end
end
