class ReviewService
  def self.create_review(params)
    case params[:type]
    when BoozeReviewDetails.type
      details = BoozeReviewDetails.create!(
        maker: params[:maker],
        subtype: params[:subtype]
      )
    when RestaurantReviewDetails.type
      details = RestaurantReviewDetails.create!(
        location: params[:location],
        subtype: params[:subtype]
      )
    when RestaurantItemReviewDetails.type
      details = RestaurantItemReviewDetails.create!(
        restaurant_review_details: RestaurantReviewDetails.find(params[:restaurant]),
        subtype: params[:subtype]
      )
    else
      throw StandardError('Invalid type to create review')
    end

    Review.create!(
      review_details: details,
      name: params[:name],
      rating: params[:rating],
      body: params[:body],
      url: params[:url]
    )
  end
end
