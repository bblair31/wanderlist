# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:cities).through(:reviews) }
    it { is_expected.to have_many(:photos).dependent(:destroy) }
    it { is_expected.to have_many(:conversations).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe '#full_name' do
    it 'returns the full name' do
      user = build(:user, first_name: 'John', last_name: 'Doe')
      expect(user.full_name).to eq('John Doe')
    end
  end

  describe '#profile_photo_url' do
    it 'returns the first photo URL' do
      user = create(:user, :with_photo)
      expect(user.profile_photo_url).to be_present
    end

    it 'returns nil when no photos exist' do
      user = create(:user)
      expect(user.profile_photo_url).to be_nil
    end
  end
end
