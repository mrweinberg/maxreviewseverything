# frozen_string_literal: true

class RestaurantItemReviewDetails < ApplicationRecord
  include ReviewDetails

  belongs_to :restaurant_review_details

  def self.type
    'Restaurant Item'
  end
end
