# frozen_string_literal: true

class RestaurantReviewDetails < ApplicationRecord
  include ReviewDetails
  
  def type
    "Restaurant"
  end
end
