# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140313182601) do

  create_table "facebook_urls", force: true do |t|
    t.string   "url"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_urls", ["search_id"], name: "index_facebook_urls_on_search_id"

  create_table "predictions", force: true do |t|
    t.integer  "dog_id"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "predictions", ["search_id"], name: "index_predictions_on_search_id"

  create_table "searches", force: true do |t|
    t.datetime "date_lost"
    t.integer  "num_results"
    t.string   "email"
    t.string   "status",              default: "queued"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "facebook_url_string"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
