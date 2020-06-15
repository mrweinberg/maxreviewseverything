# frozen_string_literal: true

skillet_details = RestaurantReviewDetails.create!(
  location: 'German Village, Columbus, OH'
)

Review.create!(
  name: 'Skillet',
  rating: 5,
  body: 'Best burger? Yeah. Best brunch? Definitely. Best meal in Columbus? Probabaly.',
  url: 'https://www.skilletruf.net/',
  review_details: skillet_detailsrake
)
