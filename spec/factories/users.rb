# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    trait :with_photo do
      after(:create) do |user|
        create(:photo, user: user)
      end
    end

    trait :with_reviews do
      after(:create) do |user|
        create_list(:review, 3, user: user)
      end
    end
  end
end
