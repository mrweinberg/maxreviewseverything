class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :review do |t|
      t.string :name
      t.decimal :rating
      t.text :body
      t.string :type

      t.timestamps
    end

    create_table :restaurant_review_details do |t|
      t.references :review_details, polymorphic: true
      t.string :
    end
  end
end
