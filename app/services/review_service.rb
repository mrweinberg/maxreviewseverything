# frozen_string_literal: true

class ReviewService
  def self.create_review(params)
    review = params['review']
    review_details = review['review_details']
    case params[:type]
    when BoozeReviewDetails.type
      details = BoozeReviewDetails.create!(
        maker: review_details['maker'],
        subtype: review_details['subtype']
      )
    when RestaurantReviewDetails.type
      details = RestaurantReviewDetails.create!(
        location: review_details['location'],
        subtype: review_details['subtype']
      )
    when RestaurantItemReviewDetails.type
      details = RestaurantItemReviewDetails.create!(
        restaurant_review_details_id: review_details['restaurant_review_details_id'],
        subtype: review_details['subtype']
      )
    when MovieReviewDetails.type
      details = MovieReviewDetails.create!(
        director: review_details['director'],
        actors: review_details['actors'].split(',').map(&:strip),
        genre: review_details['genre']
      )
    when TvShowReviewDetails.type
      details = TvShowReviewDetails.create!(
        network: review_details['network'],
        actors: review_details['actors'].split(',').map(&:strip),
        genre: review_details['genre']
      )
    when TvShowSeasonReviewDetails.type
      details = TvShowSeasonReviewDetails.create!(
        tv_show_review_details_id: review_details['tv_show_review_details_id']
      )
    when VideoGameReviewDetails.type
      details = VideoGameReviewDetails.create!(
        developer: review_details['developer'],
        genre: review_details['genre']
      )
    else
      throw StandardError('Invalid type to create review')
    end

    Review.create!(
      review_details: details,
      name: review['name'],
      rating: review['rating'],
      body: review['body'],
      url: review['url']
    )
  end

  def self.update_review(params)
    review = Review.find(params['id'])
    review_params = params['review']
    detail_params = review_params['review_details']
    case params[:type]
    when BoozeReviewDetails.type
      review.review_details.update!(
        maker: detail_params['maker'],
        subtype: detail_params['subtype']
      )
    when RestaurantReviewDetails.type
      review.review_details.update!(
        location: detail_params['location'],
        subtype: detail_params['subtype']
      )
    when RestaurantItemReviewDetails.type
      review.review_details.update!(
        restaurant_review_details_id: detail_params['restaurant_review_details_id'],
        subtype: detail_params['subtype']
      )
    when MovieReviewDetails.type
      review.review_details.update!(
        director: detail_params['director'],
        actors: detail_params['actors'].split(',').map(&:strip),
        genre: detail_params['genre']
      )
    when TvShowReviewDetails.type
      review.review_details.update!(
        network: detail_params['network'],
        actors: detail_params['actors'].split(',').map(&:strip),
        genre: detail_params['genre']
      )
    when TvShowSeasonReviewDetails.type
      review.review_details.update!(
        tv_show_review_details_id: detail_params['tv_show_review_details_id']
      )
    when VideoGameReviewDetails.type
      review.review_details.update!(
        developer: detail_params['developer'],
        genre: detail_params['genre']
      )
    else
      throw StandardError('Invalid type to create review')
    end

    review.update(
      name: review_params['name'],
      rating: review_params['rating'],
      body: review_params['body'],
      url: review_params['url']
    )
  end
end
