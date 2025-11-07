# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    rating { rand(1..5) }
    content { Faker::Lorem.paragraph(sentence_count: 5) }
    date_visited { Faker::Date.backward(days: 365) }
    association :user
    association :city
  end
end
