class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, id: :uuid do |t|
      t.references :review_details, polymorphic: true, type: :uuid, index: { name: :index_restaurant_review_details_review_details }
      t.string :name
      t.decimal :rating
      t.text :body
      t.string :type
      t.string :url

      t.timestamps
    end

    create_table :restaurant_review_details, id: :uuid do |t|
      t.string :location
    end
  end
end
