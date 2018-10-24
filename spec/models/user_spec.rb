require 'rails_helper'


RSpec.describe User, type: :model do

  let(:valid_attributes) do
    {
      first_name: "Asafaa",
      last_name: "Daevidoov",
      email: "asafD12345@hotmail.com",
      password: "password123",
      password_confirmation: "password123"
    }
  end

  let(:password_not_matching_confirmation) { valid_attributes.merge(password_confirmation: "password1234") }
  let(:password_too_short) { valid_attributes.merge(password: "1234") }
  let(:missing_email) { valid_attributes.except(:email) }

  it "is valid when expected" do
    expect(User.new(valid_attributes)).to be_valid
  end

  it "is invalid when password_confirmation and password do not match" do
    expect(User.new(password_not_matching_confirmation)).to be_invalid
  end

  it "is invalid when password is too short" do
    expect(User.new(password_too_short)).to be_invalid
  end

  it "is invalid without email" do
    expect(User.new(missing_email)).to be_invalid
  end

end
