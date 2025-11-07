# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    url { 'https://picsum.photos/200/200' }
    association :user
  end
end
