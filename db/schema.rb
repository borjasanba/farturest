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

ActiveRecord::Schema.define(version: 20151014093719) do

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "rate",              limit: 4,     null: false
    t.text     "comment",           limit: 65535
    t.integer  "source_profile_id", limit: 4,     null: false
    t.integer  "target_profile_id", limit: 4,     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "evaluations", ["source_profile_id"], name: "index_evaluations_on_source_profile_id", using: :btree
  add_index "evaluations", ["target_profile_id"], name: "index_evaluations_on_target_profile_id", using: :btree

  create_table "item_location", force: :cascade do |t|
    t.integer  "item_id",     limit: 4,                           null: false
    t.integer  "capacity",    limit: 4,                           null: false
    t.datetime "date_finish",                                     null: false
    t.decimal  "latitude",              precision: 15, scale: 10, null: false
    t.decimal  "longitude",             precision: 15, scale: 10, null: false
  end

  add_index "item_location", ["item_id"], name: "index_item_location_on_item_id", using: :btree
  add_index "item_location", ["latitude", "longitude"], name: "index_item_location_on_latitude_and_longitude", using: :btree
  add_index "item_location", ["latitude"], name: "index_item_location_on_latitude", using: :btree
  add_index "item_location", ["longitude"], name: "index_item_location_on_longitude", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "profile_id",           limit: 4,                             null: false
    t.integer  "category_id",          limit: 4,                             null: false
    t.string   "text_short",           limit: 255,                           null: false
    t.text     "text_long",            limit: 65535
    t.decimal  "price",                              precision: 3, scale: 2, null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["profile_id"], name: "index_items_on_profile_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4,     null: false
    t.integer  "application_id",    limit: 4,     null: false
    t.string   "token",             limit: 255,   null: false
    t.integer  "expires_in",        limit: 4,     null: false
    t.text     "redirect_uri",      limit: 65535, null: false
    t.datetime "created_at",                      null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4
    t.integer  "application_id",    limit: 4
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in",        limit: 4
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,                null: false
    t.string   "uid",          limit: 255,                null: false
    t.string   "secret",       limit: 255,                null: false
    t.text     "redirect_uri", limit: 65535,              null: false
    t.string   "scopes",       limit: 255,   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "user_id",             limit: 4,   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "age",                 limit: 4
    t.string   "speciality",          limit: 255
    t.integer  "gender",              limit: 1
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "evaluations", "profiles", column: "source_profile_id"
  add_foreign_key "evaluations", "profiles", column: "target_profile_id"
  add_foreign_key "item_location", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "profiles"
  add_foreign_key "profiles", "users"
end
