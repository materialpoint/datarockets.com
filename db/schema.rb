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

ActiveRecord::Schema.define(version: 20140929140231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avatars", ["user_id"], name: "index_avatars_on_user_id", using: :btree

  create_table "client_contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",          limit: nil
    t.string   "currency_code", limit: nil
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "marks", force: true do |t|
    t.integer "tag_id"
    t.integer "project_id"
  end

  add_index "marks", ["project_id"], name: "index_marks_on_project_id", using: :btree
  add_index "marks", ["tag_id"], name: "index_marks_on_tag_id", using: :btree

  create_table "member_informations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "github_profile"
    t.string   "own_blog"
    t.string   "twitter"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  add_index "member_informations", ["member_id"], name: "index_member_informations_on_member_id", using: :btree

  create_table "order_cart_items_items", force: true do |t|
    t.string   "name",       limit: nil
    t.integer  "count"
    t.decimal  "price",                  precision: 19, scale: 2, default: 0.0
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "order_cart_items_items", ["cart_id"], name: "index_order_cart_items_items_on_cart_id", using: :btree
  add_index "order_cart_items_items", ["product_id"], name: "index_order_cart_items_items_on_product_id", using: :btree

  create_table "order_cart_items_shippings", force: true do |t|
    t.decimal  "cost",       precision: 19, scale: 2, default: 0.0
    t.integer  "cart_id"
    t.integer  "shop_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "order_cart_items_shippings", ["cart_id"], name: "index_order_cart_items_shippings_on_cart_id", using: :btree
  add_index "order_cart_items_shippings", ["shop_id"], name: "index_order_cart_items_shippings_on_shop_id", using: :btree

  create_table "order_carts", force: true do |t|
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_carts", ["order_id"], name: "index_order_carts_on_order_id", using: :btree

  create_table "order_clarifications", force: true do |t|
    t.integer  "call_operator_id"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "order_contact_informations", force: true do |t|
    t.integer  "order_id"
    t.string   "name",       limit: nil
    t.integer  "country_id"
    t.string   "address",    limit: nil
    t.integer  "zip_code"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: true do |t|
    t.string   "state",      limit: nil
    t.string   "note",       limit: nil
    t.integer  "total_cost"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_images", ["post_id"], name: "index_post_images_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preview_body"
  end

  create_table "preview_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_shipping_countries", force: true do |t|
    t.integer  "product_id"
    t.integer  "country_id"
    t.decimal  "price",      precision: 19, scale: 2, default: 0.0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "product_shipping_countries", ["country_id"], name: "index_product_shipping_countries_on_country_id", using: :btree
  add_index "product_shipping_countries", ["product_id"], name: "index_product_shipping_countries_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",       limit: nil
    t.integer  "shop_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "products", ["shop_id"], name: "index_products_on_shop_id", using: :btree

  create_table "project_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_images", ["project_id"], name: "index_project_images_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preview_description"
  end

  create_table "publications", force: true do |t|
    t.integer "post_id"
    t.integer "user_id"
  end

  add_index "publications", ["post_id"], name: "index_publications_on_post_id", using: :btree
  add_index "publications", ["user_id"], name: "index_publications_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_shipping_countries", force: true do |t|
    t.integer  "shop_id"
    t.integer  "country_id"
    t.decimal  "shipping_cost", precision: 19, scale: 2, default: 0.0
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "shop_shipping_countries", ["country_id"], name: "index_shop_shipping_countries_on_country_id", using: :btree
  add_index "shop_shipping_countries", ["shop_id"], name: "index_shop_shipping_countries_on_shop_id", using: :btree

  create_table "shops", force: true do |t|
    t.string   "name",       limit: nil
    t.string   "url",        limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "remember_token", null: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "workings", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "workings", ["project_id"], name: "index_workings_on_project_id", using: :btree
  add_index "workings", ["user_id"], name: "index_workings_on_user_id", using: :btree

end
