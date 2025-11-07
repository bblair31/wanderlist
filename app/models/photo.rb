# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
