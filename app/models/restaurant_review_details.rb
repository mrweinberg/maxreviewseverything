# frozen_string_literal: true

class RestaurantReviewDetails < ApplicationRecord
  include ReviewDetails

  has_many :restaurant_item_review_details, class_name: 'RestaurantItemReviewDetails', dependent: :destroy

  def self.type
    'Restaurant'
  end
end
