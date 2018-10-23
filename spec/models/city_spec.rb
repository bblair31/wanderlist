require 'rails_helper'

describe City do

  before do
    @country = Country.create(name: "United States")
  end
  let(:attributes) do
    {
      name: "New York",
      size: "large",
      country_id: @country.id,
    }
  end
  
  it "is considered valid" do
    expect(City.new(attributes)).to be_valid
  end
end
