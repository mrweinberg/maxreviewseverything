# frozen_string_literal: true

class Review < ApplicationRecord
  TYPES = [
    BoozeReviewDetails,
    RestaurantItemReviewDetails,
    RestaurantReviewDetails
  ].freeze

  belongs_to :review_details, polymorphic: true, dependent: :destroy

  def type
    review_details.class.type
  end

  def self.detail_class_for_type(type)
    TYPES.find { |type_class| type_class.type == type }
  end
end
