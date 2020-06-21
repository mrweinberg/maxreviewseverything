# frozen_string_literal: true

class RestaurantItemReviewDetails < ApplicationRecord
  include ReviewDetails

  belongs_to :restaurant_review_details
end
