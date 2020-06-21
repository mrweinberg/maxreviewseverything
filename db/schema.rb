# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_614_205_832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'restaurant_item_review_details', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'subtype'
    t.bigint 'restaurant_review_details_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['restaurant_review_details_id'], name: 'index_restaurant_item_review_details_restaurant'
  end

  create_table 'restaurant_review_details', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'location'
    t.string 'subtype'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reviews', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'review_details_type'
    t.uuid 'review_details_id'
    t.string 'name'
    t.decimal 'rating'
    t.text 'body'
    t.string 'type'
    t.string 'url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[review_details_type review_details_id], name: 'index_restaurant_review_details_review_details'
  end
end
