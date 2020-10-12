# frozen_string_literal: true

class BoozeReviewDetails < ApplicationRecord
  include ReviewDetails

  def self.type
    'Booze'
  end
end
