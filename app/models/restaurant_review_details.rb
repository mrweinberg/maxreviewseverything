# frozen_string_literal: true

class RestaurantReviewDetails < ApplicationRecord
  include ReviewDetails

  def self.type
    'Restaurant'
  end
end
