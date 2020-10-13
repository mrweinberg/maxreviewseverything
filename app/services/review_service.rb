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
