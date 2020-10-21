# frozen_string_literal: true

class MovieReviewDetails < ApplicationRecord
  include ReviewDetails

  def self.type
    'Movie'
  end
end
