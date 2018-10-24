require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:attributes) do
    {
      name: "France",
    }
  end

  it "is considered valid" do
    expect(Country.new(attributes)).to be_valid
  end
end
