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

ActiveRecord::Schema.define(version: 20150610130436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "banners", force: :cascade do |t|
    t.text     "name"
    t.integer  "position"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_number"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "finished_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.text     "slug"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "common"
    t.integer  "position"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.text     "data_file_name",               null: false
    t.text     "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "provider"
    t.text     "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "mail_lists", force: :cascade do |t|
    t.text     "call_order"
    t.text     "order_product"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "main_banners", force: :cascade do |t|
    t.text     "name"
    t.text     "layer_1_file_name"
    t.text     "layer_1_content_type"
    t.integer  "layer_1_file_size"
    t.datetime "layer_1_updated_at"
    t.text     "layer_2_file_name"
    t.text     "layer_2_content_type"
    t.integer  "layer_2_file_size"
    t.datetime "layer_2_updated_at"
    t.text     "layer_3_file_name"
    t.text     "layer_3_content_type"
    t.integer  "layer_3_file_size"
    t.datetime "layer_3_updated_at"
    t.text     "layer_background_file_name"
    t.text     "layer_background_content_type"
    t.integer  "layer_background_file_size"
    t.datetime "layer_background_updated_at"
    t.text     "title"
    t.text     "description"
    t.integer  "position"
    t.boolean  "published"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.text     "slug"
    t.float    "price"
    t.text     "description"
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "banner_id"
    t.boolean  "offer_of_the_week"
    t.integer  "position"
    t.boolean  "business_lunch"
    t.text     "size"
    t.float    "weight"
    t.text     "diameter"
    t.text     "other"
    t.boolean  "d_monday"
    t.boolean  "d_tuesday"
    t.boolean  "d_wednesday"
    t.boolean  "d_thursday"
    t.boolean  "d_friday"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.text     "name"
    t.text     "slug"
    t.text     "logo_file_name"
    t.text     "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "position"
    t.text     "about"
    t.text     "main_image_file_name"
    t.text     "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.text     "short_description"
    t.text     "address"
    t.text     "phone_number"
    t.text     "time_of_work"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "name"
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.boolean  "published"
    t.integer  "position"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "name"
    t.text     "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text     "unconfirmed_email"
    t.boolean  "subscribe_to"
    t.text     "provider"
    t.text     "url"
    t.text     "nickname"
    t.text     "username"
    t.text     "uid"
    t.text     "card"
    t.boolean  "subscribe"
    t.text     "phone"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
