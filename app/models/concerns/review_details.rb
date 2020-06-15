# frozen_string_literal: true

module ReviewDetails
  extend ActiveSupport::Concern

  included do
    has_one :reviews, as: :review_details
  end
end
