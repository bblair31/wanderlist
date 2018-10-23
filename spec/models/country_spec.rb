require 'rails_helper'

describe Country do
  let(:attributes) do
    {
      name: "France",
    }
  end

  it "is considered valid" do
    expect(Country.new(attributes)).to be_valid
  end
end
