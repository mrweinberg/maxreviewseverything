# frozen_string_literal: true

require 'pry'

skillet_details = RestaurantReviewDetails.create!(
  location: 'German Village, Columbus, OH',
  subtype: 'American Brunch'
)

Review.create!(
  name: 'Skillet',
  rating: 5.5,
  body: 'Best burger? Yeah. Best brunch? Definitely. Best meal in Columbus? Probably.',
  url: 'https://www.skilletruf.net/',
  review_details: skillet_details
)

brekkie_details = RestaurantReviewDetails.create!(
  location: 'Grandview Yard, Columbus, OH',
  subtype: 'American Breakfast'
)

Review.create!(
  name: 'Brekkie Shack',
  rating: 2.5,
  body: 'Upside? Its the only real choice in a mile radius for breakfast. Otherwise, any other choice would be great.',
  url: 'https://www.thebrekkieshack.com/',
  review_details: brekkie_details
)

brekkie_burger = RestaurantItemReviewDetails.create!(
  subtype: 'Burger',
  restaurant_review_details: brekkie_details
)

Review.create!(
  name: 'Ohio Wagyu Burger',
  rating: 2,
  body: "Well, it's edible. And the toppings are reasonable. Too bad they don't season their meat, otherwise I'd be tempted to ever eat this again.",
  review_details: brekkie_burger
)

booze_details = BoozeReviewDetails.create!(
  subtype: 'Beer - Imperial Stout',
  maker: 'Goose Island'
)

Review.create!(
  name: 'Mon Cheri Bourbon County Stout',
  rating: 4,
  review_details: booze_details,
  body: <<-BODY
      It's a BCS: big, brash, thick, and sweet, albeit a bit less thick than usual. 
      The added cherries meld well if you like that kinda thing, but the acidity of the cherries kind of take away from the ideal cake-like nature of BCS
  BODY
)
