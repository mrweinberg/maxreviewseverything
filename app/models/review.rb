# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :review_details, polymorphic: true
end
