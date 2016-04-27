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

ActiveRecord::Schema.define(version: 20160421071336) do

  create_table "blockages", primary_key: "blockage_id", force: :cascade do |t|
    t.integer  "blockage_to_user_id",   limit: 4, null: false
    t.integer  "blockage_from_user_id", limit: 4, null: false
    t.datetime "blockage_created_at",             null: false
  end

  create_table "favourites", primary_key: "favourite_id", force: :cascade do |t|
    t.integer  "favourite_user_id",    limit: 4, null: false
    t.integer  "favourite_listing_id", limit: 4, null: false
    t.datetime "favourite_created_at",           null: false
  end

  create_table "listing_images", primary_key: "listing_image_id", force: :cascade do |t|
    t.string   "listing_image_path",         limit: 128, null: false
    t.string   "listing_image_path_low_res", limit: 128, null: false
    t.datetime "listing_image_created_at",               null: false
    t.integer  "listing_image_listing_id",   limit: 4,   null: false
  end

  create_table "listing_status", primary_key: "listing_status_id", force: :cascade do |t|
    t.string "listing_status_label",      limit: 0, null: false
    t.date   "listing_status_date"
    t.time   "listing_status_start_time"
    t.time   "listing_status_end_time"
  end

  create_table "listings", primary_key: "listing_id", force: :cascade do |t|
    t.integer  "listing_cover_image_id", limit: 4
    t.string   "listing_address",        limit: 256,                                          null: false
    t.string   "listing_suburb",         limit: 32,                                           null: false
    t.string   "listing_state",          limit: 0,                                            null: false
    t.integer  "listing_post_code",      limit: 4,                                            null: false
    t.integer  "listing_bedrooms",       limit: 4,                                            null: false
    t.integer  "listing_bathrooms",      limit: 4,                                            null: false
    t.integer  "listing_parking",        limit: 4,                                            null: false
    t.integer  "listing_land_size",      limit: 4,                                            null: false
    t.string   "listing_title",          limit: 64,                                           null: false
    t.string   "listing_subtitle",       limit: 128,                                          null: false
    t.text     "listing_description",    limit: 65535,                                        null: false
    t.string   "listing_price_type",     limit: 0,                              default: "F", null: false
    t.decimal  "listing_price_min",                    precision: 12, scale: 2,               null: false
    t.decimal  "listing_price_max",                    precision: 12, scale: 2,               null: false
    t.integer  "listing_status_id",      limit: 4,                                            null: false
    t.integer  "listing_user_id",        limit: 4,                                            null: false
    t.integer  "listing_views",          limit: 4,                              default: 0,   null: false
    t.integer  "listing_favourites",     limit: 4,                              default: 0,   null: false
    t.integer  "listing_comments",       limit: 4,                              default: 0,   null: false
    t.datetime "listing_created_at",                                                          null: false
    t.datetime "listing_updated_at",                                                          null: false
    t.datetime "listing_to_end_at",                                                           null: false
    t.datetime "listing_ended_at"
  end

  create_table "messages", primary_key: "message_id", force: :cascade do |t|
    t.integer  "message_to_user_id",   limit: 4,     null: false
    t.integer  "message_from_user_id", limit: 4,     null: false
    t.string   "message_subject",      limit: 128,   null: false
    t.text     "message_body",         limit: 65535, null: false
    t.datetime "message_sent_at",                    null: false
  end

  create_table "tag_type", primary_key: "tag_type_id", force: :cascade do |t|
    t.string "tag_type_label",    limit: 50, null: false
    t.string "tag_type_category", limit: 25, null: false
  end

  create_table "tags", primary_key: "tag_id", force: :cascade do |t|
    t.string   "tag_label",      limit: 64, null: false
    t.integer  "tag_type_id",    limit: 4,  null: false
    t.integer  "tag_listing_id", limit: 4,  null: false
    t.datetime "tag_created_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 32
    t.string   "last_name",              limit: 32
    t.string   "username",               limit: 64
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "user_type",              limit: 0,   default: "User", null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
