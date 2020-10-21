# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_20_225745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "booze_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "maker"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "director"
    t.string "actors", default: [], array: true
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restaurant_item_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "subtype"
    t.uuid "restaurant_review_details_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_review_details_id"], name: "index_restaurant_item_review_details_restaurant"
  end

  create_table "restaurant_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "location"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "review_details_type"
    t.uuid "review_details_id"
    t.string "name"
    t.decimal "rating"
    t.text "body"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_details_type", "review_details_id"], name: "index_restaurant_review_details_review_details"
  end

  create_table "tv_show_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "network"
    t.string "actors", default: [], array: true
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tv_show_season_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "tv_show_review_details_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tv_show_review_details_id"], name: "index_tv_show_seasons_tv_show"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_game_review_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "developer"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
