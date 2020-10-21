class CreateVideoGamesMoviesAndTv < ActiveRecord::Migration[6.0]
  def change
    create_table :video_game_review_details, id: :uuid do |t|
      t.string :developer
      t.string :genre

      t.timestamps
    end

    create_table :movie_review_details, id: :uuid do |t|
      t.string :director
      t.string :actors, array: true, default: []
      t.string :genre

      t.timestamps
    end

    create_table :tv_show_review_details, id: :uuid do |t|
      t.string :network
      t.string :actors, array: true, default: []
      t.string :genre

      t.timestamps
    end

    create_table :tv_show_season_review_details, id: :uuid do |t|
      t.belongs_to :tv_show_review_details,
                   type: :uuid,
                   index: { name: :index_tv_show_seasons_tv_show }

      t.timestamps
    end
  end
end
