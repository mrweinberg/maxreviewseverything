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
      binding.pry
      details = RestaurantItemReviewDetails.create!(
        restaurant_review_details: RestaurantReviewDetails.find(review_details['restaurant']),
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

  def self.update_review(params); end
end
