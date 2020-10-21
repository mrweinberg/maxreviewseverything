# frozen_string_literal: true

class TvShowSeasonReviewDetails < ApplicationRecord
  include ReviewDetails

  belongs_to :tv_show_review_details

  def self.type
    'TV Show Season'
  end
end
