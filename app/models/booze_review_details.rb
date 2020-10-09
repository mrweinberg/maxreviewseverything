# frozen_string_literal: true

class BoozeReviewDetails < ApplicationRecord
  include ReviewDetails

  def type
    'Booze'
  end
end
