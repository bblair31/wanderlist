# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    size { %w[small medium large].sample }
    association :country
  end
end
