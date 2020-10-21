# frozen_string_literal: true

class VideoGameReviewDetails < ApplicationRecord
  include ReviewDetails

  def self.type
    'Video Game'
  end
end
