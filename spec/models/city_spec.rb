require 'rails_helper'

RSpec.describe City, type: :model do
  before do
    @country = Country.create(name: "United States")
  end

  let(:valid_attributes) do
    {
      name: "New York",
      size: "large",
      country_id: @country.id,
    }
  end

  let(:missing_name) { valid_attributes.except(:name) }

  it "is valid when expected" do
    expect(City.new(valid_attributes)).to be_valid
  end

  it "is invalid without name" do
    expect(City.new(missing_name)).to be_invalid
  end

end
