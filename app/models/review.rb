# frozen_string_literal: true

class Review < ApplicationRecord
  TYPES = [
    BoozeReviewDetails,
    RestaurantItemReviewDetails,
    RestaurantReviewDetails
  ].freeze

  belongs_to :review_details, polymorphic: true

  def type
    review_details.class.type
  end
end
