# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    name { Faker::Address.unique.country }
  end
end
