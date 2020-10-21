# frozen_string_literal: true

class TvShowReviewDetails < ApplicationRecord
  include ReviewDetails

  has_many :tv_show_season_review_details, class_name: 'TvShowSeasonReviewDetails', dependent: :destroy

  def self.type
    'TV Show'
  end
end
