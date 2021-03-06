# frozen_string_literal: true

module ReviewDetails
  extend ActiveSupport::Concern

  def parent_review
    Review.find_by(review_details_id: id)
  end

  included do
    has_one :review, as: :review_details, dependent: :destroy
  end
end
