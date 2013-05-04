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

ActiveRecord::Schema.define(version: 20130504184450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: true do |t|
    t.string   "instagram_image_id"
    t.integer  "user_id"
    t.string   "body"
    t.string   "author"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["instagram_image_id"], name: "index_reviews_on_instagram_image_id", using: :btree
  add_index "reviews", ["token"], name: "index_reviews_on_token", using: :btree

  create_table "users", force: true do |t|
    t.string   "instagram_username"
    t.string   "email"
    t.text     "api_token"
    t.string   "access_token"
    t.string   "instagram_id"
    t.string   "instagram_full_name"
    t.string   "instagram_profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", using: :btree
  add_index "users", ["api_token"], name: "index_users_on_api_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["instagram_full_name"], name: "index_users_on_instagram_full_name", using: :btree
  add_index "users", ["instagram_id"], name: "index_users_on_instagram_id", using: :btree
  add_index "users", ["instagram_username"], name: "index_users_on_instagram_username", using: :btree

end
