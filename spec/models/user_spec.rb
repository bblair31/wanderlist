require 'rails_helper'

describe User do

  let(:attributes) do
    {
      first_name: "Asaf",
      last_name: "Daevidoov",
      email: "asafD12345@hotmail.com",
      password: "password123",
      password_confirmation: "password123"
    }
  end

  it "is considered valid" do
    expect(User.new(attributes)).to be_valid
  end
end
